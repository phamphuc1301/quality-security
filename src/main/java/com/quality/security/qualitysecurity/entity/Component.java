package com.quality.security.qualitysecurity.entity;

public class Component {
    private String componentName;
    private int ratio;

    public String getComponentName() {
        return componentName;
    }

    public void setComponentName(String componentName) {
        this.componentName = componentName;
    }

    public int getRatio() {
        return ratio;
    }

    public void setRatio(int ratio) {
        this.ratio = ratio;
    }

    public Component(String componentName, int ratio) {
        this.componentName = componentName;
        this.ratio = ratio;
    }

    public Component() {
    }
}
