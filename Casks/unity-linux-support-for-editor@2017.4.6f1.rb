cask 'unity-linux-support-for-editor@2017.4.6f1' do
  version '2017.4.6f1,c24f30193bac'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/c24f30193bac/MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-2017.4.6f1.pkg"
  name 'Linux Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Linux-Support-for-Editor-2017.4.6f1.pkg'

  depends_on cask: 'unity@2017.4.6f1'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.4.6f1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.4.6f1'
end
