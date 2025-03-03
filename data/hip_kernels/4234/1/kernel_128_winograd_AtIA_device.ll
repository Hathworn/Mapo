; ModuleID = '../data/hip_kernels/4234/1/main.cu'
source_filename = "../data/hip_kernels/4234/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24kernel_128_winograd_AtIAPfS_S_S_E4bias = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ24kernel_128_winograd_AtIAPfS_S_S_E5scale = internal unnamed_addr addrspace(3) global float undef, align 4
@input = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z24kernel_128_winograd_AtIAPfS_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul nuw nsw i32 %9, 6
  %11 = add nuw nsw i32 %10, %7
  %12 = shl nuw nsw i32 %11, 11
  %13 = shl i32 %5, 9
  %14 = shl i32 %6, 7
  %15 = add i32 %14, %8
  %16 = add i32 %15, %13
  %17 = add i32 %16, %12
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %11
  store float %20, float addrspace(3)* %21, align 4, !tbaa !5
  %22 = sext i32 %8 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %24, float addrspace(3)* @_ZZ24kernel_128_winograd_AtIAPfS_S_S_E4bias, align 4, !tbaa !5
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %26, float addrspace(3)* @_ZZ24kernel_128_winograd_AtIAPfS_S_S_E5scale, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %9, label %104 [
    i32 0, label %27
    i32 1, label %46
    i32 2, label %64
    i32 3, label %82
  ]

27:                                               ; preds = %4
  %28 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %7
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %30 = add nuw nsw i32 %7, 6
  %31 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %30
  %32 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %33 = fadd contract float %29, %32
  %34 = add nuw nsw i32 %7, 12
  %35 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %34
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %37 = fadd contract float %33, %36
  %38 = add nuw nsw i32 %7, 18
  %39 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %38
  %40 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %41 = fadd contract float %37, %40
  %42 = add nuw nsw i32 %7, 24
  %43 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %45 = fadd contract float %41, %44
  br label %104

46:                                               ; preds = %4
  %47 = add nuw nsw i32 %7, 6
  %48 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %47
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %50 = add nuw nsw i32 %7, 12
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %53 = fsub contract float %49, %52
  %54 = add nuw nsw i32 %7, 18
  %55 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %57 = fmul contract float %56, 2.000000e+00
  %58 = fadd contract float %53, %57
  %59 = add nuw nsw i32 %7, 24
  %60 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %62 = fmul contract float %61, 2.000000e+00
  %63 = fsub contract float %58, %62
  br label %104

64:                                               ; preds = %4
  %65 = add nuw nsw i32 %7, 6
  %66 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %65
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %68 = add nuw nsw i32 %7, 12
  %69 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %71 = fadd contract float %67, %70
  %72 = add nuw nsw i32 %7, 18
  %73 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %75 = fmul contract float %74, 4.000000e+00
  %76 = fadd contract float %71, %75
  %77 = add nuw nsw i32 %7, 24
  %78 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %80 = fmul contract float %79, 4.000000e+00
  %81 = fadd contract float %76, %80
  br label %104

82:                                               ; preds = %4
  %83 = add nuw nsw i32 %7, 6
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %83
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %86 = add nuw nsw i32 %7, 12
  %87 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %86
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %89 = fsub contract float %85, %88
  %90 = add nuw nsw i32 %7, 18
  %91 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %93 = fmul contract float %92, 8.000000e+00
  %94 = fadd contract float %89, %93
  %95 = add nuw nsw i32 %7, 24
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %95
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %98 = fmul contract float %97, 8.000000e+00
  %99 = fsub contract float %94, %98
  %100 = add nuw nsw i32 %7, 30
  %101 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %100
  %102 = load float, float addrspace(3)* %101, align 4, !tbaa !5
  %103 = fadd contract float %102, %99
  br label %104

104:                                              ; preds = %4, %82, %64, %46, %27
  %105 = phi float [ 0.000000e+00, %4 ], [ %103, %82 ], [ %81, %64 ], [ %63, %46 ], [ %45, %27 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store float %105, float addrspace(3)* %21, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %106 = icmp ugt i32 %9, 3
  br i1 %106, label %218, label %107

107:                                              ; preds = %104
  %108 = icmp eq i32 %5, 3
  %109 = icmp ugt i32 %9, 1
  %110 = select i1 %108, i1 %109, i1 false
  br i1 %110, label %218, label %111

111:                                              ; preds = %107
  switch i32 %7, label %218 [
    i32 0, label %112
    i32 1, label %133
    i32 2, label %153
    i32 3, label %175
  ]

112:                                              ; preds = %111
  %113 = load float, float addrspace(3)* @_ZZ24kernel_128_winograd_AtIAPfS_S_S_E5scale, align 4, !tbaa !5
  %114 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %10
  %115 = bitcast float addrspace(3)* %114 to <2 x float> addrspace(3)*
  %116 = load <2 x float>, <2 x float> addrspace(3)* %115, align 4, !tbaa !5
  %117 = extractelement <2 x float> %116, i64 0
  %118 = extractelement <2 x float> %116, i64 1
  %119 = fadd contract float %117, %118
  %120 = add nuw nsw i32 %10, 2
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %120
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %123 = fadd contract float %119, %122
  %124 = add nuw nsw i32 %10, 3
  %125 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %124
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !5
  %127 = fadd contract float %123, %126
  %128 = add nuw nsw i32 %10, 4
  %129 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !5
  %131 = fadd contract float %127, %130
  %132 = fmul contract float %113, %131
  br label %201

133:                                              ; preds = %111
  %134 = load float, float addrspace(3)* @_ZZ24kernel_128_winograd_AtIAPfS_S_S_E5scale, align 4, !tbaa !5
  %135 = or i32 %10, 1
  %136 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %135
  %137 = bitcast float addrspace(3)* %136 to <2 x float> addrspace(3)*
  %138 = load <2 x float>, <2 x float> addrspace(3)* %137, align 4, !tbaa !5
  %139 = extractelement <2 x float> %138, i64 0
  %140 = extractelement <2 x float> %138, i64 1
  %141 = fsub contract float %139, %140
  %142 = add nuw nsw i32 %10, 3
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %142
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !5
  %145 = fmul contract float %144, 2.000000e+00
  %146 = fadd contract float %141, %145
  %147 = add nuw nsw i32 %10, 4
  %148 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %147
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %150 = fmul contract float %149, 2.000000e+00
  %151 = fsub contract float %146, %150
  %152 = fmul contract float %134, %151
  br label %201

153:                                              ; preds = %111
  %154 = icmp eq i32 %6, 3
  br i1 %154, label %218, label %155

155:                                              ; preds = %153
  %156 = load float, float addrspace(3)* @_ZZ24kernel_128_winograd_AtIAPfS_S_S_E5scale, align 4, !tbaa !5
  %157 = or i32 %10, 1
  %158 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %157
  %159 = bitcast float addrspace(3)* %158 to <2 x float> addrspace(3)*
  %160 = load <2 x float>, <2 x float> addrspace(3)* %159, align 4, !tbaa !5
  %161 = extractelement <2 x float> %160, i64 0
  %162 = extractelement <2 x float> %160, i64 1
  %163 = fadd contract float %161, %162
  %164 = add nuw nsw i32 %10, 3
  %165 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %164
  %166 = load float, float addrspace(3)* %165, align 4, !tbaa !5
  %167 = fmul contract float %166, 4.000000e+00
  %168 = fadd contract float %163, %167
  %169 = add nuw nsw i32 %10, 4
  %170 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %169
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !5
  %172 = fmul contract float %171, 4.000000e+00
  %173 = fadd contract float %168, %172
  %174 = fmul contract float %156, %173
  br label %201

175:                                              ; preds = %111
  %176 = icmp eq i32 %6, 3
  br i1 %176, label %218, label %177

177:                                              ; preds = %175
  %178 = load float, float addrspace(3)* @_ZZ24kernel_128_winograd_AtIAPfS_S_S_E5scale, align 4, !tbaa !5
  %179 = or i32 %10, 1
  %180 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %179
  %181 = bitcast float addrspace(3)* %180 to <2 x float> addrspace(3)*
  %182 = load <2 x float>, <2 x float> addrspace(3)* %181, align 4, !tbaa !5
  %183 = extractelement <2 x float> %182, i64 0
  %184 = extractelement <2 x float> %182, i64 1
  %185 = fsub contract float %183, %184
  %186 = add nuw nsw i32 %10, 3
  %187 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %186
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %189 = fmul contract float %188, 8.000000e+00
  %190 = fadd contract float %185, %189
  %191 = add nuw nsw i32 %10, 4
  %192 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !5
  %194 = fmul contract float %193, 8.000000e+00
  %195 = fsub contract float %190, %194
  %196 = add nuw nsw i32 %10, 5
  %197 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @input, i32 0, i32 %196
  %198 = load float, float addrspace(3)* %197, align 4, !tbaa !5
  %199 = fadd contract float %198, %195
  %200 = fmul contract float %178, %199
  br label %201

201:                                              ; preds = %177, %155, %133, %112
  %202 = phi float [ %200, %177 ], [ %174, %155 ], [ %152, %133 ], [ %132, %112 ]
  %203 = phi i32 [ 512, %177 ], [ 384, %155 ], [ 256, %133 ], [ 128, %112 ]
  %204 = load float, float addrspace(3)* @_ZZ24kernel_128_winograd_AtIAPfS_S_S_E4bias, align 4, !tbaa !5
  %205 = fadd contract float %204, %202
  %206 = fcmp contract ogt float %205, 0.000000e+00
  %207 = select contract i1 %206, float %205, float 0.000000e+00
  %208 = shl i32 %6, 9
  %209 = shl i32 %5, 13
  %210 = shl nuw nsw i32 %9, 11
  %211 = add nuw nsw i32 %210, 2048
  %212 = add i32 %209, %211
  %213 = add i32 %8, %203
  %214 = add i32 %213, %208
  %215 = add i32 %214, %212
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(1)* %3, i64 %216
  store float %207, float addrspace(1)* %217, align 4, !tbaa !5
  br label %218

218:                                              ; preds = %201, %111, %153, %175, %104, %107
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
