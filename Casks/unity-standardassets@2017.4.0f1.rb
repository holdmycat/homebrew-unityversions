cask 'unity-standardassets@2017.4.0f1' do
  version '2017.4.0f1,b5bd171ee9ba'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/b5bd171ee9ba/MacStandardAssetsInstaller/StandardAssets.pkg"
  name 'Standard Assets'
  homepage 'https://unity3d.com/unity/'

  pkg 'StandardAssets.pkg'

  depends_on cask: 'unity@2017.4.0f1'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.4.0f1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.4.0f1'
end
