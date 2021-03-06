cask 'unity-appletv-support-for-editor@2018.3.0f2' do
  version '2018.3.0f2,6e9a27477296'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/6e9a27477296/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-2018.3.0f2.pkg"
  name 'tvOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-AppleTV-Support-for-Editor-2018.3.0f2.pkg'

  depends_on cask: 'unity@2018.3.0f2'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.3.0f2"
      FileUtils.move "/Applications/Unity-2018.3.0f2", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.3.0f2"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0f2/PlaybackEngines/AppleTVSupport'
end
