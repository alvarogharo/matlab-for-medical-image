function imdifTot = dif_aniso_mult(im1, im2, niter, k, lambda, opcion)
imdif1 = dif_aniso(im1, niter, k, lambda, opcion);
imdif2 = dif_aniso(im2, niter, k, lambda, opcion);

imdifTot = (imdif1.^2 + imdif2.^2).^(1/2);
end

