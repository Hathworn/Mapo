; ModuleID = '../data/hip_kernels/16734/39/main.cu'
source_filename = "../data/hip_kernels/16734/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6VecAddPKiS0_Pii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  %18 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %19 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %20 = add nsw i32 %19, %18
  %21 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7
  %22 = add nsw i32 %20, %21
  store i32 %22, i32 addrspace(1)* %17, align 4, !tbaa !7
  %23 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %24 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %25 = add nsw i32 %24, %23
  %26 = add nsw i32 %25, %22
  store i32 %26, i32 addrspace(1)* %17, align 4, !tbaa !7
  %27 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %28 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %29 = add nsw i32 %28, %27
  %30 = add nsw i32 %29, %26
  store i32 %30, i32 addrspace(1)* %17, align 4, !tbaa !7
  %31 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %32 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %33 = add nsw i32 %32, %31
  %34 = add nsw i32 %33, %30
  store i32 %34, i32 addrspace(1)* %17, align 4, !tbaa !7
  %35 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %36 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %37 = add nsw i32 %36, %35
  %38 = add nsw i32 %37, %34
  store i32 %38, i32 addrspace(1)* %17, align 4, !tbaa !7
  %39 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %40 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %41 = add nsw i32 %40, %39
  %42 = add nsw i32 %41, %38
  store i32 %42, i32 addrspace(1)* %17, align 4, !tbaa !7
  %43 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %44 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %45 = add nsw i32 %44, %43
  %46 = add nsw i32 %45, %42
  store i32 %46, i32 addrspace(1)* %17, align 4, !tbaa !7
  %47 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %48 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %49 = add nsw i32 %48, %47
  %50 = add nsw i32 %49, %46
  store i32 %50, i32 addrspace(1)* %17, align 4, !tbaa !7
  %51 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %52 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %53 = add nsw i32 %52, %51
  %54 = add nsw i32 %53, %50
  store i32 %54, i32 addrspace(1)* %17, align 4, !tbaa !7
  %55 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %56 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %57 = add nsw i32 %56, %55
  %58 = add nsw i32 %57, %54
  store i32 %58, i32 addrspace(1)* %17, align 4, !tbaa !7
  %59 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %60 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %61 = add nsw i32 %60, %59
  %62 = add nsw i32 %61, %58
  store i32 %62, i32 addrspace(1)* %17, align 4, !tbaa !7
  %63 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %64 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %65 = add nsw i32 %64, %63
  %66 = add nsw i32 %65, %62
  store i32 %66, i32 addrspace(1)* %17, align 4, !tbaa !7
  %67 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %68 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %69 = add nsw i32 %68, %67
  %70 = add nsw i32 %69, %66
  store i32 %70, i32 addrspace(1)* %17, align 4, !tbaa !7
  %71 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %72 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %73 = add nsw i32 %72, %71
  %74 = add nsw i32 %73, %70
  store i32 %74, i32 addrspace(1)* %17, align 4, !tbaa !7
  %75 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %76 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %77 = add nsw i32 %76, %75
  %78 = add nsw i32 %77, %74
  store i32 %78, i32 addrspace(1)* %17, align 4, !tbaa !7
  %79 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %80 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %81 = add nsw i32 %80, %79
  %82 = add nsw i32 %81, %78
  store i32 %82, i32 addrspace(1)* %17, align 4, !tbaa !7
  %83 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %84 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %85 = add nsw i32 %84, %83
  %86 = add nsw i32 %85, %82
  store i32 %86, i32 addrspace(1)* %17, align 4, !tbaa !7
  %87 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %88 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %89 = add nsw i32 %88, %87
  %90 = add nsw i32 %89, %86
  store i32 %90, i32 addrspace(1)* %17, align 4, !tbaa !7
  %91 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %92 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %93 = add nsw i32 %92, %91
  %94 = add nsw i32 %93, %90
  store i32 %94, i32 addrspace(1)* %17, align 4, !tbaa !7
  %95 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %96 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %97 = add nsw i32 %96, %95
  %98 = add nsw i32 %97, %94
  store i32 %98, i32 addrspace(1)* %17, align 4, !tbaa !7
  %99 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %100 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %101 = add nsw i32 %100, %99
  %102 = add nsw i32 %101, %98
  store i32 %102, i32 addrspace(1)* %17, align 4, !tbaa !7
  %103 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %104 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %105 = add nsw i32 %104, %103
  %106 = add nsw i32 %105, %102
  store i32 %106, i32 addrspace(1)* %17, align 4, !tbaa !7
  %107 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %108 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %109 = add nsw i32 %108, %107
  %110 = add nsw i32 %109, %106
  store i32 %110, i32 addrspace(1)* %17, align 4, !tbaa !7
  %111 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %112 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %113 = add nsw i32 %112, %111
  %114 = add nsw i32 %113, %110
  store i32 %114, i32 addrspace(1)* %17, align 4, !tbaa !7
  %115 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %116 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %117 = add nsw i32 %116, %115
  %118 = add nsw i32 %117, %114
  store i32 %118, i32 addrspace(1)* %17, align 4, !tbaa !7
  %119 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %120 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %121 = add nsw i32 %120, %119
  %122 = add nsw i32 %121, %118
  store i32 %122, i32 addrspace(1)* %17, align 4, !tbaa !7
  %123 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %124 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %125 = add nsw i32 %124, %123
  %126 = add nsw i32 %125, %122
  store i32 %126, i32 addrspace(1)* %17, align 4, !tbaa !7
  %127 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %128 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %129 = add nsw i32 %128, %127
  %130 = add nsw i32 %129, %126
  store i32 %130, i32 addrspace(1)* %17, align 4, !tbaa !7
  %131 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %132 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %133 = add nsw i32 %132, %131
  %134 = add nsw i32 %133, %130
  store i32 %134, i32 addrspace(1)* %17, align 4, !tbaa !7
  %135 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %136 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %137 = add nsw i32 %136, %135
  %138 = add nsw i32 %137, %134
  store i32 %138, i32 addrspace(1)* %17, align 4, !tbaa !7
  %139 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %140 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %141 = add nsw i32 %140, %139
  %142 = add nsw i32 %141, %138
  store i32 %142, i32 addrspace(1)* %17, align 4, !tbaa !7
  %143 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %144 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %145 = add nsw i32 %144, %143
  %146 = add nsw i32 %145, %142
  store i32 %146, i32 addrspace(1)* %17, align 4, !tbaa !7
  %147 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %148 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %149 = add nsw i32 %148, %147
  %150 = add nsw i32 %149, %146
  store i32 %150, i32 addrspace(1)* %17, align 4, !tbaa !7
  %151 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %152 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %153 = add nsw i32 %152, %151
  %154 = add nsw i32 %153, %150
  store i32 %154, i32 addrspace(1)* %17, align 4, !tbaa !7
  %155 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %156 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %157 = add nsw i32 %156, %155
  %158 = add nsw i32 %157, %154
  store i32 %158, i32 addrspace(1)* %17, align 4, !tbaa !7
  %159 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %160 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %161 = add nsw i32 %160, %159
  %162 = add nsw i32 %161, %158
  store i32 %162, i32 addrspace(1)* %17, align 4, !tbaa !7
  %163 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %164 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %165 = add nsw i32 %164, %163
  %166 = add nsw i32 %165, %162
  store i32 %166, i32 addrspace(1)* %17, align 4, !tbaa !7
  %167 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %168 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %169 = add nsw i32 %168, %167
  %170 = add nsw i32 %169, %166
  store i32 %170, i32 addrspace(1)* %17, align 4, !tbaa !7
  %171 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %172 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %173 = add nsw i32 %172, %171
  %174 = add nsw i32 %173, %170
  store i32 %174, i32 addrspace(1)* %17, align 4, !tbaa !7
  %175 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %176 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %177 = add nsw i32 %176, %175
  %178 = add nsw i32 %177, %174
  store i32 %178, i32 addrspace(1)* %17, align 4, !tbaa !7
  %179 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %180 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %181 = add nsw i32 %180, %179
  %182 = add nsw i32 %181, %178
  store i32 %182, i32 addrspace(1)* %17, align 4, !tbaa !7
  %183 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %184 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %185 = add nsw i32 %184, %183
  %186 = add nsw i32 %185, %182
  store i32 %186, i32 addrspace(1)* %17, align 4, !tbaa !7
  %187 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %188 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %189 = add nsw i32 %188, %187
  %190 = add nsw i32 %189, %186
  store i32 %190, i32 addrspace(1)* %17, align 4, !tbaa !7
  %191 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %192 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %193 = add nsw i32 %192, %191
  %194 = add nsw i32 %193, %190
  store i32 %194, i32 addrspace(1)* %17, align 4, !tbaa !7
  %195 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %196 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %197 = add nsw i32 %196, %195
  %198 = add nsw i32 %197, %194
  store i32 %198, i32 addrspace(1)* %17, align 4, !tbaa !7
  %199 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %200 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %201 = add nsw i32 %200, %199
  %202 = add nsw i32 %201, %198
  store i32 %202, i32 addrspace(1)* %17, align 4, !tbaa !7
  %203 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %204 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %205 = add nsw i32 %204, %203
  %206 = add nsw i32 %205, %202
  store i32 %206, i32 addrspace(1)* %17, align 4, !tbaa !7
  %207 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %208 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %209 = add nsw i32 %208, %207
  %210 = add nsw i32 %209, %206
  store i32 %210, i32 addrspace(1)* %17, align 4, !tbaa !7
  %211 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %212 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %213 = add nsw i32 %212, %211
  %214 = add nsw i32 %213, %210
  store i32 %214, i32 addrspace(1)* %17, align 4, !tbaa !7
  %215 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %216 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %217 = add nsw i32 %216, %215
  %218 = add nsw i32 %217, %214
  store i32 %218, i32 addrspace(1)* %17, align 4, !tbaa !7
  %219 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %220 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %221 = add nsw i32 %220, %219
  %222 = add nsw i32 %221, %218
  store i32 %222, i32 addrspace(1)* %17, align 4, !tbaa !7
  %223 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %224 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %225 = add nsw i32 %224, %223
  %226 = add nsw i32 %225, %222
  store i32 %226, i32 addrspace(1)* %17, align 4, !tbaa !7
  %227 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %228 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %229 = add nsw i32 %228, %227
  %230 = add nsw i32 %229, %226
  store i32 %230, i32 addrspace(1)* %17, align 4, !tbaa !7
  %231 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %232 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %233 = add nsw i32 %232, %231
  %234 = add nsw i32 %233, %230
  store i32 %234, i32 addrspace(1)* %17, align 4, !tbaa !7
  %235 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %236 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %237 = add nsw i32 %236, %235
  %238 = add nsw i32 %237, %234
  store i32 %238, i32 addrspace(1)* %17, align 4, !tbaa !7
  %239 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %240 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %241 = add nsw i32 %240, %239
  %242 = add nsw i32 %241, %238
  store i32 %242, i32 addrspace(1)* %17, align 4, !tbaa !7
  %243 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %244 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %245 = add nsw i32 %244, %243
  %246 = add nsw i32 %245, %242
  store i32 %246, i32 addrspace(1)* %17, align 4, !tbaa !7
  %247 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %248 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %249 = add nsw i32 %248, %247
  %250 = add nsw i32 %249, %246
  store i32 %250, i32 addrspace(1)* %17, align 4, !tbaa !7
  %251 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %252 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %253 = add nsw i32 %252, %251
  %254 = add nsw i32 %253, %250
  store i32 %254, i32 addrspace(1)* %17, align 4, !tbaa !7
  %255 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %256 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %257 = add nsw i32 %256, %255
  %258 = add nsw i32 %257, %254
  store i32 %258, i32 addrspace(1)* %17, align 4, !tbaa !7
  %259 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %260 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %261 = add nsw i32 %260, %259
  %262 = add nsw i32 %261, %258
  store i32 %262, i32 addrspace(1)* %17, align 4, !tbaa !7
  %263 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %264 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %265 = add nsw i32 %264, %263
  %266 = add nsw i32 %265, %262
  store i32 %266, i32 addrspace(1)* %17, align 4, !tbaa !7
  %267 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %268 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %269 = add nsw i32 %268, %267
  %270 = add nsw i32 %269, %266
  store i32 %270, i32 addrspace(1)* %17, align 4, !tbaa !7
  %271 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %272 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %273 = add nsw i32 %272, %271
  %274 = add nsw i32 %273, %270
  store i32 %274, i32 addrspace(1)* %17, align 4, !tbaa !7
  %275 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %276 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %277 = add nsw i32 %276, %275
  %278 = add nsw i32 %277, %274
  store i32 %278, i32 addrspace(1)* %17, align 4, !tbaa !7
  %279 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %280 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %281 = add nsw i32 %280, %279
  %282 = add nsw i32 %281, %278
  store i32 %282, i32 addrspace(1)* %17, align 4, !tbaa !7
  %283 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %284 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %285 = add nsw i32 %284, %283
  %286 = add nsw i32 %285, %282
  store i32 %286, i32 addrspace(1)* %17, align 4, !tbaa !7
  %287 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %288 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %289 = add nsw i32 %288, %287
  %290 = add nsw i32 %289, %286
  store i32 %290, i32 addrspace(1)* %17, align 4, !tbaa !7
  %291 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %292 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %293 = add nsw i32 %292, %291
  %294 = add nsw i32 %293, %290
  store i32 %294, i32 addrspace(1)* %17, align 4, !tbaa !7
  %295 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %296 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %297 = add nsw i32 %296, %295
  %298 = add nsw i32 %297, %294
  store i32 %298, i32 addrspace(1)* %17, align 4, !tbaa !7
  %299 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %300 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %301 = add nsw i32 %300, %299
  %302 = add nsw i32 %301, %298
  store i32 %302, i32 addrspace(1)* %17, align 4, !tbaa !7
  %303 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %304 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %305 = add nsw i32 %304, %303
  %306 = add nsw i32 %305, %302
  store i32 %306, i32 addrspace(1)* %17, align 4, !tbaa !7
  %307 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %308 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %309 = add nsw i32 %308, %307
  %310 = add nsw i32 %309, %306
  store i32 %310, i32 addrspace(1)* %17, align 4, !tbaa !7
  %311 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %312 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %313 = add nsw i32 %312, %311
  %314 = add nsw i32 %313, %310
  store i32 %314, i32 addrspace(1)* %17, align 4, !tbaa !7
  %315 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %316 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %317 = add nsw i32 %316, %315
  %318 = add nsw i32 %317, %314
  store i32 %318, i32 addrspace(1)* %17, align 4, !tbaa !7
  %319 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %320 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %321 = add nsw i32 %320, %319
  %322 = add nsw i32 %321, %318
  store i32 %322, i32 addrspace(1)* %17, align 4, !tbaa !7
  %323 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %324 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %325 = add nsw i32 %324, %323
  %326 = add nsw i32 %325, %322
  store i32 %326, i32 addrspace(1)* %17, align 4, !tbaa !7
  %327 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %328 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %329 = add nsw i32 %328, %327
  %330 = add nsw i32 %329, %326
  store i32 %330, i32 addrspace(1)* %17, align 4, !tbaa !7
  %331 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %332 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %333 = add nsw i32 %332, %331
  %334 = add nsw i32 %333, %330
  store i32 %334, i32 addrspace(1)* %17, align 4, !tbaa !7
  %335 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %336 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %337 = add nsw i32 %336, %335
  %338 = add nsw i32 %337, %334
  store i32 %338, i32 addrspace(1)* %17, align 4, !tbaa !7
  %339 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %340 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %341 = add nsw i32 %340, %339
  %342 = add nsw i32 %341, %338
  store i32 %342, i32 addrspace(1)* %17, align 4, !tbaa !7
  %343 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %344 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %345 = add nsw i32 %344, %343
  %346 = add nsw i32 %345, %342
  store i32 %346, i32 addrspace(1)* %17, align 4, !tbaa !7
  %347 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %348 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %349 = add nsw i32 %348, %347
  %350 = add nsw i32 %349, %346
  store i32 %350, i32 addrspace(1)* %17, align 4, !tbaa !7
  %351 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %352 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %353 = add nsw i32 %352, %351
  %354 = add nsw i32 %353, %350
  store i32 %354, i32 addrspace(1)* %17, align 4, !tbaa !7
  %355 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %356 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %357 = add nsw i32 %356, %355
  %358 = add nsw i32 %357, %354
  store i32 %358, i32 addrspace(1)* %17, align 4, !tbaa !7
  %359 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %360 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %361 = add nsw i32 %360, %359
  %362 = add nsw i32 %361, %358
  store i32 %362, i32 addrspace(1)* %17, align 4, !tbaa !7
  %363 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %364 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %365 = add nsw i32 %364, %363
  %366 = add nsw i32 %365, %362
  store i32 %366, i32 addrspace(1)* %17, align 4, !tbaa !7
  %367 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %368 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %369 = add nsw i32 %368, %367
  %370 = add nsw i32 %369, %366
  store i32 %370, i32 addrspace(1)* %17, align 4, !tbaa !7
  %371 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %372 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %373 = add nsw i32 %372, %371
  %374 = add nsw i32 %373, %370
  store i32 %374, i32 addrspace(1)* %17, align 4, !tbaa !7
  %375 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %376 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %377 = add nsw i32 %376, %375
  %378 = add nsw i32 %377, %374
  store i32 %378, i32 addrspace(1)* %17, align 4, !tbaa !7
  %379 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %380 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %381 = add nsw i32 %380, %379
  %382 = add nsw i32 %381, %378
  store i32 %382, i32 addrspace(1)* %17, align 4, !tbaa !7
  %383 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %384 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %385 = add nsw i32 %384, %383
  %386 = add nsw i32 %385, %382
  store i32 %386, i32 addrspace(1)* %17, align 4, !tbaa !7
  %387 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %388 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %389 = add nsw i32 %388, %387
  %390 = add nsw i32 %389, %386
  store i32 %390, i32 addrspace(1)* %17, align 4, !tbaa !7
  %391 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %392 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %393 = add nsw i32 %392, %391
  %394 = add nsw i32 %393, %390
  store i32 %394, i32 addrspace(1)* %17, align 4, !tbaa !7
  %395 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %396 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %397 = add nsw i32 %396, %395
  %398 = add nsw i32 %397, %394
  store i32 %398, i32 addrspace(1)* %17, align 4, !tbaa !7
  %399 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %400 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %401 = add nsw i32 %400, %399
  %402 = add nsw i32 %401, %398
  store i32 %402, i32 addrspace(1)* %17, align 4, !tbaa !7
  %403 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %404 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %405 = add nsw i32 %404, %403
  %406 = add nsw i32 %405, %402
  store i32 %406, i32 addrspace(1)* %17, align 4, !tbaa !7
  %407 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %408 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %409 = add nsw i32 %408, %407
  %410 = add nsw i32 %409, %406
  store i32 %410, i32 addrspace(1)* %17, align 4, !tbaa !7
  %411 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %412 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %413 = add nsw i32 %412, %411
  %414 = add nsw i32 %413, %410
  store i32 %414, i32 addrspace(1)* %17, align 4, !tbaa !7
  %415 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %416 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %417 = add nsw i32 %416, %415
  %418 = add nsw i32 %417, %414
  store i32 %418, i32 addrspace(1)* %17, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
