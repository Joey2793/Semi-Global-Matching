# Semi-Global-Matching
<p> Stereo matching is used for finding corresponding pixels in a pair of images. This
project is required to execute Semi-Global Matching Algorithm, which was developed
by Heiko Hirschmueller. By using the Algorithm, the disparity map is constructed by
given two epipolar images.</p>

<p>This algorithm is to find corresponded points, since using epipolar images, the
corresponding points are in the same line, which means they have the same y coordinate.
The disparity d is showed below:<br>
<img src='https://github.com/Joey2793/Semi-Global-Matching/blob/master/data/fomula1.JPG'></br>  
Since the value of disparity doesn't know, different disparity value can be tried to see the total
cost energy of whole pixels, the smallest cost corresponded disparity is the disparity
value for that pixel. Here shows the formula below:<br>
<img src='https://github.com/Joey2793/Semi-Global-Matching/blob/master/data/fomula2.JPG'></br>
E is the energy function, p is any pixel in image, D is the estimated disparity images, q
is the neighbor pixels of p, C is the matching cost measuring the similarity between
correspondences, P1 is the penalty for disparity changes equal to 1, and P2 is the penalty
for disparity changes larger than 1 (P1< P2). Dynamic programming is used to optimize solution:<br>
<img src='https://github.com/Joey2793/Semi-Global-Matching/blob/master/data/formula3.JPG'></p>

