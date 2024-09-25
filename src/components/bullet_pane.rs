use leptos::*;

#[component]
pub fn BulletPane() -> impl IntoView {
    let (text, text_setter) = create_signal("sample".to_string());
    view! {
        <input type_="text" prop:value=text on:input=move |ev| {
            text_setter.set(event_target_value(&ev));
        } />
        <p>{text}</p>
    }
}
