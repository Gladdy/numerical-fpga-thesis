module SignalVisualization where

import Data.List
import SignalHOFs
import System.Process

showImage img = readProcess "python" [] stdinstr
	where
		stdinstr = "from pylab import *\n" ++
			"imshow( " ++ (show img) ++ ", interpolation='none',cmap=cm.hot )\n" ++
			"show()"

showImageStream ims = readProcess "python" [] stdinstr
	where
		stdinstr = 
			"import matplotlib\n" ++
			"matplotlib.use('TkAgg')\n" ++
			"import numpy as np\n" ++
			"import matplotlib.pyplot as plt\n" ++
			"import matplotlib.animation as animation\n" ++
			"fig = plt.figure()\n" ++
			"frames = " ++ (show ims) ++"\n" ++
			"vmin = np.amin( frames )\n" ++
			"vmax = np.amax( frames )\n" ++
			"ims = []\n" ++
			"for f in frames:\n" ++
			"    im = plt.imshow( f, interpolation='none',cmap=plt.cm.hot, vmin=vmin, vmax=vmax )\n" ++
			"    ims.append([im])\n" ++
			"ani = animation.ArtistAnimation(fig, ims, interval=100, blit=True, repeat_delay=1000)\n" ++
			"plt.show()\n"

showHFImage img = readProcess "python" [] stdinstr
	where
		stdinstr = "from pylab import *\n" ++
			"imshow( " ++ (show $ transpose img) ++ ", interpolation='nearest' )\n" ++
			"xlabel( \"time\" )\n" ++
			"ylabel( \"position\" )\n" ++
			"title( \"1D heatflow\" )\n" ++
			"show()"

show1DSignals signals = readProcess "python" [] stdinstr
	where
		signalnames = zipWith (\_ n -> "xs" ++ (show n))  signals [1..]
		signaldefs = concat $ zipWith (\s n -> n ++ " = " ++ (show s) ++ "\n") signals signalnames
		timeplots = concat $ map (\n -> "plot(" ++ n ++ ", \'.-\')\n") signalnames
		freqplots = concat $ map (\n -> "semilogy(abs(fft( " ++ n ++ " ))[:len(" ++ n ++ ") / 2])\n") signalnames
		stdinstr = "from pylab import *\n" ++
			"subplot(2,1,1)\n" ++
			"title(\"Time signals\")\n" ++
			signaldefs ++
			timeplots ++
			"subplot(2,1,2)\n" ++
			"title(\"Frequency signals\")\n" ++
			freqplots ++
			"show()"

