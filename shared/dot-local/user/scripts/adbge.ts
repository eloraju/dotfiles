#!/usr/bin/env bun
import { $ } from "bun";

const result = (await $`adb shell getprop debug.firebase.analytics.app`.text()).replace(/\s/g, "")
if (result === "veikkaus.app") {
  console.log("Debug already events enabled. Skipping the rest.")
  $`exit 0`
}

console.log("Enabling debug events")
try {
  await $`adb shell setprop debug.firebase.analytics.app veikkaus.app`
  console.log("Debug events enabled")
} catch (e) {
  console.error("Failed to enable debug events", e)
}
