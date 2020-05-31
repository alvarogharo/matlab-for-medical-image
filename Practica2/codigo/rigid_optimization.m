function transformedResult = rigid_optimization(image, transformedIm)
optimizacion = registration.optimizer.RegularStepGradientDescent();
metric = registration.metric.MattesMutualInformation();

trans = imregtform(transformedIm,image,'similarity',optimizacion,metric);

transformedResult = imwarp(transformedIm,trans,'OutputView',imref2d(size(image)));
end