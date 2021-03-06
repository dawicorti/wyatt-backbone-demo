mobileweb-run: mobileweb-prepare
	titanium build -p mobileweb
	sleep 2 && xdg-open "http://localhost:8000" &
	statik -p 8000 build/mobileweb

mobileweb-prepare: app-prepare
	@rsync -ru assets/* Resources/

android-run: android-prepare
	titanium build -p android

android-prepare: app-prepare
	@mkdir -p Resources/android
	@rsync -ru assets/* Resources/android/

app-prepare:
	@mkdir -p Resources/todos
	@rsync app.js Resources/
	@rsync -ru todos/* Resources/todos/
	
clean:
	rm -rf Resources build
