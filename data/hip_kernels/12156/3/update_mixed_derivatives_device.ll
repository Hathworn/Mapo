; ModuleID = '../data/hip_kernels/12156/3/main.cu'
source_filename = "../data/hip_kernels/12156/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z24update_mixed_derivativesPdS_S_jjddj(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, double %5, double %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = mul i32 %9, %7
  %14 = add i32 %13, %11
  %15 = mul i32 %10, %7
  %16 = add i32 %15, %12
  %17 = mul i32 %16, %3
  %18 = add i32 %17, %14
  %19 = icmp eq i32 %16, 0
  br i1 %19, label %25, label %20

20:                                               ; preds = %8
  %21 = add i32 %4, -1
  %22 = icmp eq i32 %16, %21
  %23 = icmp ne i32 %14, 0
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %27, label %42

25:                                               ; preds = %8
  %26 = icmp eq i32 %14, 0
  br i1 %26, label %42, label %27

27:                                               ; preds = %20, %25
  %28 = add i32 %3, -1
  %29 = icmp eq i32 %14, %28
  br i1 %29, label %42, label %30

30:                                               ; preds = %27
  %31 = add i32 %18, 1
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !5, !amdgpu.noclobber !9
  %35 = add i32 %18, -1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !5, !amdgpu.noclobber !9
  %39 = fsub contract double %34, %38
  %40 = fmul contract double %5, 2.000000e+00
  %41 = fdiv contract double %39, %40
  br label %250

42:                                               ; preds = %27, %25, %20
  %43 = add i32 %4, -1
  %44 = icmp eq i32 %16, %43
  %45 = select i1 %19, i1 true, i1 %44
  br i1 %45, label %46, label %51

46:                                               ; preds = %42
  %47 = add i32 %3, -1
  %48 = icmp eq i32 %14, 0
  %49 = icmp eq i32 %14, %47
  %50 = select i1 %48, i1 true, i1 %49
  br i1 %50, label %68, label %225

51:                                               ; preds = %42
  %52 = icmp eq i32 %14, 0
  %53 = add i32 %3, -1
  %54 = icmp eq i32 %14, %53
  %55 = select i1 %52, i1 true, i1 %54
  br i1 %55, label %56, label %225

56:                                               ; preds = %51
  %57 = add i32 %18, %3
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %0, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !5, !amdgpu.noclobber !9
  %61 = sub i32 %18, %3
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !5, !amdgpu.noclobber !9
  %65 = fsub contract double %60, %64
  %66 = fmul contract double %6, 2.000000e+00
  %67 = fdiv contract double %65, %66
  br label %250

68:                                               ; preds = %46
  %69 = select i1 %19, i1 %48, i1 false
  br i1 %69, label %70, label %102

70:                                               ; preds = %68
  %71 = bitcast double addrspace(1)* %1 to <2 x double> addrspace(1)*
  %72 = load <2 x double>, <2 x double> addrspace(1)* %71, align 8, !tbaa !5
  %73 = extractelement <2 x double> %72, i64 0
  %74 = extractelement <2 x double> %72, i64 1
  %75 = fsub contract double %74, %73
  %76 = fdiv contract double %75, %5
  %77 = zext i32 %3 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %0, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !5, !amdgpu.noclobber !9
  %80 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %81 = fsub contract double %79, %80
  %82 = fdiv contract double %81, %6
  %83 = add i32 %3, 1
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !5, !amdgpu.noclobber !9
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !5, !amdgpu.noclobber !9
  %89 = fsub contract double %86, %88
  %90 = fdiv contract double %89, %6
  %91 = getelementptr inbounds double, double addrspace(1)* %1, i64 %84
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !5, !amdgpu.noclobber !9
  %93 = getelementptr inbounds double, double addrspace(1)* %1, i64 %77
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !5, !amdgpu.noclobber !9
  %95 = fsub contract double %92, %94
  %96 = fdiv contract double %95, %5
  %97 = fadd contract double %76, %82
  %98 = fmul contract double %97, 7.500000e-01
  %99 = fadd contract double %90, %96
  %100 = fmul contract double %99, 2.500000e-01
  %101 = fsub contract double %98, %100
  br label %250

102:                                              ; preds = %68
  %103 = select i1 %19, i1 %49, i1 false
  br i1 %103, label %104, label %143

104:                                              ; preds = %102
  %105 = zext i32 %14 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %1, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !5, !amdgpu.noclobber !9
  %108 = add i32 %3, -2
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %1, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !5, !amdgpu.noclobber !9
  %112 = fsub contract double %107, %111
  %113 = fdiv contract double %112, %5
  %114 = shl i32 %3, 1
  %115 = add i32 %114, -2
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %0, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !5, !amdgpu.noclobber !9
  %119 = getelementptr inbounds double, double addrspace(1)* %0, i64 %109
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !5, !amdgpu.noclobber !9
  %121 = fsub contract double %118, %120
  %122 = fdiv contract double %121, %6
  %123 = add i32 %114, -1
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %0, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !5, !amdgpu.noclobber !9
  %127 = getelementptr inbounds double, double addrspace(1)* %0, i64 %105
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !5, !amdgpu.noclobber !9
  %129 = fsub contract double %126, %128
  %130 = fdiv contract double %129, %6
  %131 = getelementptr inbounds double, double addrspace(1)* %1, i64 %116
  %132 = bitcast double addrspace(1)* %131 to <2 x double> addrspace(1)*
  %133 = load <2 x double>, <2 x double> addrspace(1)* %132, align 8, !tbaa !5
  %134 = extractelement <2 x double> %133, i64 0
  %135 = extractelement <2 x double> %133, i64 1
  %136 = fsub contract double %135, %134
  %137 = fdiv contract double %136, %5
  %138 = fadd contract double %113, %130
  %139 = fmul contract double %138, 7.500000e-01
  %140 = fadd contract double %122, %137
  %141 = fmul contract double %140, 2.500000e-01
  %142 = fsub contract double %139, %141
  br label %250

143:                                              ; preds = %102
  %144 = select i1 %44, i1 %48, i1 false
  br i1 %144, label %145, label %181

145:                                              ; preds = %143
  %146 = add i32 %4, -2
  %147 = mul i32 %146, %3
  %148 = add i32 %147, 1
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %1, i64 %149
  %151 = load double, double addrspace(1)* %150, align 8, !tbaa !5, !amdgpu.noclobber !9
  %152 = zext i32 %147 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %1, i64 %152
  %154 = load double, double addrspace(1)* %153, align 8, !tbaa !5, !amdgpu.noclobber !9
  %155 = fsub contract double %151, %154
  %156 = fdiv contract double %155, %5
  %157 = zext i32 %17 to i64
  %158 = getelementptr inbounds double, double addrspace(1)* %0, i64 %157
  %159 = load double, double addrspace(1)* %158, align 8, !tbaa !5, !amdgpu.noclobber !9
  %160 = getelementptr inbounds double, double addrspace(1)* %0, i64 %152
  %161 = load double, double addrspace(1)* %160, align 8, !tbaa !5, !amdgpu.noclobber !9
  %162 = fsub contract double %159, %161
  %163 = fdiv contract double %162, %6
  %164 = getelementptr inbounds double, double addrspace(1)* %0, i64 %149
  %165 = load double, double addrspace(1)* %164, align 8, !tbaa !5, !amdgpu.noclobber !9
  %166 = fsub contract double %159, %165
  %167 = fdiv contract double %166, %6
  %168 = add i32 %17, 1
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds double, double addrspace(1)* %1, i64 %169
  %171 = load double, double addrspace(1)* %170, align 8, !tbaa !5, !amdgpu.noclobber !9
  %172 = getelementptr inbounds double, double addrspace(1)* %1, i64 %157
  %173 = load double, double addrspace(1)* %172, align 8, !tbaa !5, !amdgpu.noclobber !9
  %174 = fsub contract double %171, %173
  %175 = fdiv contract double %174, %5
  %176 = fadd contract double %163, %175
  %177 = fmul contract double %176, 7.500000e-01
  %178 = fadd contract double %156, %167
  %179 = fmul contract double %178, 2.500000e-01
  %180 = fsub contract double %177, %179
  br label %250

181:                                              ; preds = %143
  %182 = select i1 %44, i1 %49, i1 false
  br i1 %182, label %183, label %254

183:                                              ; preds = %181
  %184 = add i32 %4, -2
  %185 = mul i32 %184, %3
  %186 = add i32 %185, %3
  %187 = add i32 %186, -1
  %188 = zext i32 %187 to i64
  %189 = getelementptr inbounds double, double addrspace(1)* %1, i64 %188
  %190 = load double, double addrspace(1)* %189, align 8, !tbaa !5, !amdgpu.noclobber !9
  %191 = add i32 %186, -2
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds double, double addrspace(1)* %1, i64 %192
  %194 = load double, double addrspace(1)* %193, align 8, !tbaa !5, !amdgpu.noclobber !9
  %195 = fsub contract double %190, %194
  %196 = fdiv contract double %195, %5
  %197 = mul i32 %4, %3
  %198 = add i32 %197, -2
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds double, double addrspace(1)* %0, i64 %199
  %201 = load double, double addrspace(1)* %200, align 8, !tbaa !5, !amdgpu.noclobber !9
  %202 = getelementptr inbounds double, double addrspace(1)* %0, i64 %192
  %203 = load double, double addrspace(1)* %202, align 8, !tbaa !5, !amdgpu.noclobber !9
  %204 = fsub contract double %201, %203
  %205 = fdiv contract double %204, %6
  %206 = add i32 %197, -1
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds double, double addrspace(1)* %0, i64 %207
  %209 = load double, double addrspace(1)* %208, align 8, !tbaa !5, !amdgpu.noclobber !9
  %210 = getelementptr inbounds double, double addrspace(1)* %0, i64 %188
  %211 = load double, double addrspace(1)* %210, align 8, !tbaa !5, !amdgpu.noclobber !9
  %212 = fsub contract double %209, %211
  %213 = fdiv contract double %212, %6
  %214 = getelementptr inbounds double, double addrspace(1)* %1, i64 %207
  %215 = load double, double addrspace(1)* %214, align 8, !tbaa !5, !amdgpu.noclobber !9
  %216 = getelementptr inbounds double, double addrspace(1)* %1, i64 %199
  %217 = load double, double addrspace(1)* %216, align 8, !tbaa !5, !amdgpu.noclobber !9
  %218 = fsub contract double %215, %217
  %219 = fdiv contract double %218, %5
  %220 = fadd contract double %213, %219
  %221 = fmul contract double %220, 7.500000e-01
  %222 = fadd contract double %196, %205
  %223 = fmul contract double %222, 2.500000e-01
  %224 = fsub contract double %221, %223
  br label %250

225:                                              ; preds = %51, %46
  %226 = add i32 %18, 1
  %227 = zext i32 %226 to i64
  %228 = getelementptr inbounds double, double addrspace(1)* %1, i64 %227
  %229 = load double, double addrspace(1)* %228, align 8, !tbaa !5, !amdgpu.noclobber !9
  %230 = add i32 %18, -1
  %231 = zext i32 %230 to i64
  %232 = getelementptr inbounds double, double addrspace(1)* %1, i64 %231
  %233 = load double, double addrspace(1)* %232, align 8, !tbaa !5, !amdgpu.noclobber !9
  %234 = fsub contract double %229, %233
  %235 = fmul contract double %5, 2.000000e+00
  %236 = fdiv contract double %234, %235
  %237 = add i32 %18, %3
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds double, double addrspace(1)* %0, i64 %238
  %240 = load double, double addrspace(1)* %239, align 8, !tbaa !5, !amdgpu.noclobber !9
  %241 = sub i32 %18, %3
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds double, double addrspace(1)* %0, i64 %242
  %244 = load double, double addrspace(1)* %243, align 8, !tbaa !5, !amdgpu.noclobber !9
  %245 = fsub contract double %240, %244
  %246 = fmul contract double %6, 2.000000e+00
  %247 = fdiv contract double %245, %246
  %248 = fadd contract double %236, %247
  %249 = fmul contract double %248, 5.000000e-01
  br label %250

250:                                              ; preds = %30, %225, %104, %183, %145, %70, %56
  %251 = phi double [ %67, %56 ], [ %101, %70 ], [ %180, %145 ], [ %224, %183 ], [ %142, %104 ], [ %249, %225 ], [ %41, %30 ]
  %252 = zext i32 %18 to i64
  %253 = getelementptr inbounds double, double addrspace(1)* %2, i64 %252
  store double %251, double addrspace(1)* %253, align 8, !tbaa !5
  br label %254

254:                                              ; preds = %250, %181
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
