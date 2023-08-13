shader_type canvas_item;

uniform float rotation = 0.0;
uniform vec2 rotation_offset = vec2(0.5);

void fragment() {
  float rotation_anchored = rotation * (1.0 - UV.y);
  mat2 rotation_mat = mat2(vec2(cos(rotation_anchored), sin(rotation_anchored)), vec2(-sin(rotation_anchored), cos(rotation_anchored)));
  vec2 centered_uv = UV - rotation_offset;
  vec2 rotated_uv = centered_uv * rotation_mat;
  COLOR = texture(TEXTURE, rotated_uv + rotation_offset);
}