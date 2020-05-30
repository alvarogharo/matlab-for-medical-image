from scipy import signal
import numpy as np
import cv2


def correlation_coefficient(patch1, patch2):
    product = np.mean((patch1 - patch1.mean()) * (patch2 - patch2.mean()))
    stds = patch1.std() * patch2.std()
    if stds == 0:
        return 0
    else:
        product /= stds
        return product

mr1 = cv2.imread("mr1.png")
ct = cv2.imread("CT.png")
elast_brains = cv2.imread("elastik brains.png")
elastix = cv2.imread("elastix.png")

mr1 = cv2.cvtColor(mr1, cv2.COLOR_BGR2GRAY)
ct = cv2.cvtColor(ct, cv2.COLOR_BGR2GRAY)
elast_brains = cv2.cvtColor(elast_brains, cv2.COLOR_BGR2GRAY)
elastix = cv2.cvtColor(elastix, cv2.COLOR_BGR2GRAY)

corr = correlation_coefficient(mr1, ct)
print("Starting correlation: " + str(corr))
corr = correlation_coefficient(mr1, elast_brains)
print("Elastic transform BRAINS correlation: " + str(corr))
corr = correlation_coefficient(mr1, elastix)
print("Elastic transform Elastix correlation: " + str(corr))
