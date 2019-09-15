# JobsListTestTask
Test task for Ciklum

Task description https://paper.dropbox.com/doc/Coople-Test-Task-Q06s6Re57DdOhME9xx9hf

"The app should be well designed and scalable." is very smeared task requirement for single screen app. 
In current realization we can easily replace each layer (API, View, Presenter, Model) and reuse functionality such: list refreshing or load more mechanism if we add more screens with list data. We can add Router layer if we want to be more flexible in screen presentation, but I think it is unnecessary for one screen app.

3d point in task "Use any available cache mechanism" looks like default HTTP caching (NSURLCache in iOS).

