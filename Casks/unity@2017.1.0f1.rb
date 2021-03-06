cask 'unity@2017.1.0f1' do
  version '2017.1.0f1,4d7fe18a2f34'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/4d7fe18a2f34/MacEditorInstaller/Unity.pkg"
  name 'Unity 2017.1.0f1'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.1.0f1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.1.0f1'
end
