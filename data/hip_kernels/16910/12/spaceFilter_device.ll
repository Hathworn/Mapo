; ModuleID = '../data/hip_kernels/16910/12/main.cu'
source_filename = "../data/hip_kernels/16910/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU = internal addrspace(3) global [96 x float] undef, align 16
@_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU = internal addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11spaceFilterPKdPKfS2_PKiS4_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %10 = fptosi double %9 to i32
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !5, !amdgpu.noclobber !9
  %13 = fptosi double %12 to i32
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !5, !amdgpu.noclobber !9
  %16 = fptosi double %15 to i32
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 10
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !5, !amdgpu.noclobber !9
  %19 = fptosi double %18 to i32
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !5, !amdgpu.noclobber !9
  %22 = fptosi double %21 to i32
  %23 = icmp slt i32 %7, %19
  br i1 %23, label %24, label %35

24:                                               ; preds = %6
  %25 = sext i32 %8 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !10, !amdgpu.noclobber !9
  %28 = mul nsw i32 %27, %19
  %29 = add nsw i32 %28, %7
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !10, !amdgpu.noclobber !9
  %33 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %7
  %34 = addrspacecast i32 addrspace(3)* %33 to i32*
  store volatile i32 %32, i32* %34, align 4, !tbaa !10
  br label %35

35:                                               ; preds = %24, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = mul nsw i32 %19, %16
  %37 = icmp slt i32 %7, %36
  br i1 %37, label %38, label %56

38:                                               ; preds = %35
  %39 = freeze i32 %7
  %40 = freeze i32 %19
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %41, %40
  %43 = sub i32 %39, %42
  %44 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %43
  %45 = addrspacecast i32 addrspace(3)* %44 to i32*
  %46 = load volatile i32, i32* %45, align 4, !tbaa !10
  %47 = mul i32 %41, %13
  %48 = add i32 %47, %8
  %49 = mul i32 %48, %22
  %50 = add i32 %49, %46
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !12, !amdgpu.noclobber !9
  %54 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %7
  %55 = addrspacecast float addrspace(3)* %54 to float*
  store volatile float %53, float* %55, align 4, !tbaa !12
  br label %56

56:                                               ; preds = %38, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = icmp slt i32 %7, %10
  br i1 %57, label %58, label %240

58:                                               ; preds = %56
  %59 = icmp sgt i32 %16, 0
  %60 = icmp sgt i32 %19, 0
  %61 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %62 = getelementptr i8, i8 addrspace(4)* %61, i64 4
  %63 = bitcast i8 addrspace(4)* %62 to i16 addrspace(4)*
  %64 = load i16, i16 addrspace(4)* %63, align 4, !range !14, !invariant.load !9
  %65 = zext i16 %64 to i32
  %66 = and i32 %19, 7
  %67 = icmp ult i32 %19, 8
  %68 = and i32 %19, -8
  %69 = icmp eq i32 %66, 0
  br label %70

70:                                               ; preds = %58, %237
  %71 = phi i32 [ %7, %58 ], [ %238, %237 ]
  br i1 %59, label %72, label %237

72:                                               ; preds = %70, %227
  %73 = phi i32 [ %235, %227 ], [ 0, %70 ]
  br i1 %60, label %74, label %227

74:                                               ; preds = %72
  %75 = mul nsw i32 %73, %19
  br i1 %67, label %202, label %76

76:                                               ; preds = %74, %76
  %77 = phi float [ %198, %76 ], [ 0.000000e+00, %74 ]
  %78 = phi i32 [ %199, %76 ], [ 0, %74 ]
  %79 = phi i32 [ %200, %76 ], [ 0, %74 ]
  %80 = add nsw i32 %78, %75
  %81 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %80
  %82 = addrspacecast float addrspace(3)* %81 to float*
  %83 = load volatile float, float* %82, align 4, !tbaa !12
  %84 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %78
  %85 = addrspacecast i32 addrspace(3)* %84 to i32*
  %86 = load volatile i32, i32* %85, align 4, !tbaa !10
  %87 = mul nsw i32 %86, %10
  %88 = add nsw i32 %87, %71
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !12
  %92 = fmul contract float %83, %91
  %93 = fadd contract float %77, %92
  %94 = or i32 %78, 1
  %95 = add nsw i32 %94, %75
  %96 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %95
  %97 = addrspacecast float addrspace(3)* %96 to float*
  %98 = load volatile float, float* %97, align 4, !tbaa !12
  %99 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %94
  %100 = addrspacecast i32 addrspace(3)* %99 to i32*
  %101 = load volatile i32, i32* %100, align 4, !tbaa !10
  %102 = mul nsw i32 %101, %10
  %103 = add nsw i32 %102, %71
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !12
  %107 = fmul contract float %98, %106
  %108 = fadd contract float %93, %107
  %109 = or i32 %78, 2
  %110 = add nsw i32 %109, %75
  %111 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %110
  %112 = addrspacecast float addrspace(3)* %111 to float*
  %113 = load volatile float, float* %112, align 4, !tbaa !12
  %114 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %109
  %115 = addrspacecast i32 addrspace(3)* %114 to i32*
  %116 = load volatile i32, i32* %115, align 4, !tbaa !10
  %117 = mul nsw i32 %116, %10
  %118 = add nsw i32 %117, %71
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !12
  %122 = fmul contract float %113, %121
  %123 = fadd contract float %108, %122
  %124 = or i32 %78, 3
  %125 = add nsw i32 %124, %75
  %126 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %125
  %127 = addrspacecast float addrspace(3)* %126 to float*
  %128 = load volatile float, float* %127, align 4, !tbaa !12
  %129 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %124
  %130 = addrspacecast i32 addrspace(3)* %129 to i32*
  %131 = load volatile i32, i32* %130, align 4, !tbaa !10
  %132 = mul nsw i32 %131, %10
  %133 = add nsw i32 %132, %71
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !12
  %137 = fmul contract float %128, %136
  %138 = fadd contract float %123, %137
  %139 = or i32 %78, 4
  %140 = add nsw i32 %139, %75
  %141 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %140
  %142 = addrspacecast float addrspace(3)* %141 to float*
  %143 = load volatile float, float* %142, align 4, !tbaa !12
  %144 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %139
  %145 = addrspacecast i32 addrspace(3)* %144 to i32*
  %146 = load volatile i32, i32* %145, align 4, !tbaa !10
  %147 = mul nsw i32 %146, %10
  %148 = add nsw i32 %147, %71
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !12
  %152 = fmul contract float %143, %151
  %153 = fadd contract float %138, %152
  %154 = or i32 %78, 5
  %155 = add nsw i32 %154, %75
  %156 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %155
  %157 = addrspacecast float addrspace(3)* %156 to float*
  %158 = load volatile float, float* %157, align 4, !tbaa !12
  %159 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %154
  %160 = addrspacecast i32 addrspace(3)* %159 to i32*
  %161 = load volatile i32, i32* %160, align 4, !tbaa !10
  %162 = mul nsw i32 %161, %10
  %163 = add nsw i32 %162, %71
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !12
  %167 = fmul contract float %158, %166
  %168 = fadd contract float %153, %167
  %169 = or i32 %78, 6
  %170 = add nsw i32 %169, %75
  %171 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %170
  %172 = addrspacecast float addrspace(3)* %171 to float*
  %173 = load volatile float, float* %172, align 4, !tbaa !12
  %174 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %169
  %175 = addrspacecast i32 addrspace(3)* %174 to i32*
  %176 = load volatile i32, i32* %175, align 4, !tbaa !10
  %177 = mul nsw i32 %176, %10
  %178 = add nsw i32 %177, %71
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !12
  %182 = fmul contract float %173, %181
  %183 = fadd contract float %168, %182
  %184 = or i32 %78, 7
  %185 = add nsw i32 %184, %75
  %186 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %185
  %187 = addrspacecast float addrspace(3)* %186 to float*
  %188 = load volatile float, float* %187, align 4, !tbaa !12
  %189 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %184
  %190 = addrspacecast i32 addrspace(3)* %189 to i32*
  %191 = load volatile i32, i32* %190, align 4, !tbaa !10
  %192 = mul nsw i32 %191, %10
  %193 = add nsw i32 %192, %71
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %1, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !12
  %197 = fmul contract float %188, %196
  %198 = fadd contract float %183, %197
  %199 = add nuw nsw i32 %78, 8
  %200 = add i32 %79, 8
  %201 = icmp eq i32 %200, %68
  br i1 %201, label %202, label %76, !llvm.loop !15

202:                                              ; preds = %76, %74
  %203 = phi float [ undef, %74 ], [ %198, %76 ]
  %204 = phi float [ 0.000000e+00, %74 ], [ %198, %76 ]
  %205 = phi i32 [ 0, %74 ], [ %199, %76 ]
  br i1 %69, label %227, label %206

206:                                              ; preds = %202, %206
  %207 = phi float [ %223, %206 ], [ %204, %202 ]
  %208 = phi i32 [ %224, %206 ], [ %205, %202 ]
  %209 = phi i32 [ %225, %206 ], [ 0, %202 ]
  %210 = add nsw i32 %208, %75
  %211 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2sU, i32 0, i32 %210
  %212 = addrspacecast float addrspace(3)* %211 to float*
  %213 = load volatile float, float* %212, align 4, !tbaa !12
  %214 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11spaceFilterPKdPKfS2_PKiS4_PfE2iU, i32 0, i32 %208
  %215 = addrspacecast i32 addrspace(3)* %214 to i32*
  %216 = load volatile i32, i32* %215, align 4, !tbaa !10
  %217 = mul nsw i32 %216, %10
  %218 = add nsw i32 %217, %71
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !12
  %222 = fmul contract float %213, %221
  %223 = fadd contract float %207, %222
  %224 = add nuw nsw i32 %208, 1
  %225 = add i32 %209, 1
  %226 = icmp eq i32 %225, %66
  br i1 %226, label %227, label %206, !llvm.loop !17

227:                                              ; preds = %202, %206, %72
  %228 = phi float [ 0.000000e+00, %72 ], [ %203, %202 ], [ %223, %206 ]
  %229 = mul i32 %73, %13
  %230 = add i32 %229, %8
  %231 = mul i32 %230, %10
  %232 = add i32 %231, %71
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %5, i64 %233
  store float %228, float addrspace(1)* %234, align 4, !tbaa !12
  %235 = add nuw nsw i32 %73, 1
  %236 = icmp eq i32 %235, %16
  br i1 %236, label %237, label %72, !llvm.loop !19

237:                                              ; preds = %227, %70
  %238 = add i32 %71, %65
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %239 = icmp slt i32 %238, %10
  br i1 %239, label %70, label %240, !llvm.loop !20

240:                                              ; preds = %237, %56
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !7, i64 0}
!14 = !{i16 1, i16 1025}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !16}
