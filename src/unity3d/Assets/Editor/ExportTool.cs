using System.Collections.Generic;
using UnityEditor;

class ExportTool {
  public static void ExportProjectWebGl() {
    List<string> scenes = new List<string>();
    foreach (EditorBuildSettingsScene scene in EditorBuildSettings.scenes) {
      if (scene.enabled) scenes.Add(scene.path);
    }

    BuildPipeline.BuildPlayer(scenes.ToArray(), "../../dist/webgl", BuildTarget.WebGL, BuildOptions.None);
  }

  public static void ExportProjectLinux() {
    List<string> scenes = new List<string>();
    foreach (EditorBuildSettingsScene scene in EditorBuildSettings.scenes) {
      if (scene.enabled) scenes.Add(scene.path);
    }

    BuildPipeline.BuildPlayer(scenes.ToArray(), "../../dist/linux/cyclogame", BuildTarget.StandaloneLinux64, BuildOptions.None);
  }
}