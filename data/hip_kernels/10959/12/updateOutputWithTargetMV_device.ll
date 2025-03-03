; ModuleID = '../data/hip_kernels/10959/12/main.cu'
source_filename = "../data/hip_kernels/10959/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPf(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i64 %7, i64 %8, i64 %9, i64 %10, float addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = mul nsw i64 %14, %7
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = mul nsw i64 %14, %9
  %18 = getelementptr inbounds float, float addrspace(1)* %11, i64 %17
  %19 = getelementptr inbounds float, float addrspace(1)* %6, i64 %14
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !4, !amdgpu.noclobber !8
  %21 = fadd contract float %20, -5.000000e-01
  %22 = fptosi float %21 to i32
  %23 = shl nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %3, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !4, !amdgpu.noclobber !8
  %27 = fadd contract float %26, -5.000000e-01
  %28 = fptosi float %27 to i32
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %5, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !4, !amdgpu.noclobber !8
  %32 = fadd contract float %31, 5.000000e-01
  %33 = fptosi float %32 to i32
  %34 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !4, !amdgpu.noclobber !8
  %36 = fadd contract float %35, 5.000000e-01
  %37 = fptosi float %36 to i32
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %39 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %40 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 12
  %41 = bitcast i8 addrspace(4)* %40 to i32 addrspace(4)*
  %42 = load i32, i32 addrspace(4)* %41, align 4, !tbaa !9
  %43 = getelementptr i8, i8 addrspace(4)* %39, i64 4
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 4, !range !18, !invariant.load !8
  %46 = zext i16 %45 to i32
  %47 = udiv i32 %42, %46
  %48 = mul i32 %47, %46
  %49 = icmp ugt i32 %42, %48
  %50 = zext i1 %49 to i32
  %51 = add i32 %47, %50
  %52 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %53 = icmp slt i32 %38, %37
  br i1 %53, label %54, label %76

54:                                               ; preds = %12
  %55 = zext i32 %52 to i64
  %56 = icmp slt i64 %55, %10
  %57 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %52
  %58 = icmp ult i32 %52, 16
  %59 = shl nuw nsw i32 %52, 3
  %60 = icmp eq i32 %52, 0
  %61 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %59
  %62 = add nuw nsw i32 %59, 1
  %63 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %62
  %64 = add nuw nsw i32 %59, 2
  %65 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %64
  %66 = add nuw nsw i32 %59, 3
  %67 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %66
  %68 = add nuw nsw i32 %59, 4
  %69 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %68
  %70 = add nuw nsw i32 %59, 5
  %71 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %70
  %72 = add nuw nsw i32 %59, 6
  %73 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %72
  %74 = add nuw nsw i32 %59, 7
  %75 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 %74
  br label %77

76:                                               ; preds = %152, %12
  ret void

77:                                               ; preds = %54, %152
  %78 = phi i32 [ %38, %54 ], [ %153, %152 ]
  %79 = add nsw i32 %78, %33
  %80 = sext i32 %79 to i64
  %81 = mul nsw i64 %80, %8
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %56, label %102, label %83

83:                                               ; preds = %102, %77
  %84 = phi float [ 0.000000e+00, %77 ], [ %110, %102 ]
  store float %84, float addrspace(3)* %57, align 4, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %58, label %85, label %114

85:                                               ; preds = %83
  %86 = load float, float addrspace(3)* %61, align 16, !tbaa !4
  %87 = fadd contract float %86, 0.000000e+00
  %88 = load float, float addrspace(3)* %63, align 4, !tbaa !4
  %89 = fadd contract float %87, %88
  %90 = load float, float addrspace(3)* %65, align 8, !tbaa !4
  %91 = fadd contract float %89, %90
  %92 = load float, float addrspace(3)* %67, align 4, !tbaa !4
  %93 = fadd contract float %91, %92
  %94 = load float, float addrspace(3)* %69, align 16, !tbaa !4
  %95 = fadd contract float %93, %94
  %96 = load float, float addrspace(3)* %71, align 4, !tbaa !4
  %97 = fadd contract float %95, %96
  %98 = load float, float addrspace(3)* %73, align 8, !tbaa !4
  %99 = fadd contract float %97, %98
  %100 = load float, float addrspace(3)* %75, align 4, !tbaa !4
  %101 = fadd contract float %99, %100
  store float %101, float addrspace(3)* %57, align 4, !tbaa !4
  br label %114

102:                                              ; preds = %77, %102
  %103 = phi i64 [ %112, %102 ], [ %55, %77 ]
  %104 = phi float [ %110, %102 ], [ 0.000000e+00, %77 ]
  %105 = getelementptr inbounds float, float addrspace(1)* %16, i64 %103
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !4
  %107 = getelementptr inbounds float, float addrspace(1)* %82, i64 %103
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !4
  %109 = fmul contract float %106, %108
  %110 = fadd contract float %104, %109
  %111 = add nuw nsw i64 %103, 128
  %112 = and i64 %111, 4294967295
  %113 = icmp slt i64 %112, %10
  br i1 %113, label %102, label %83, !llvm.loop !20

114:                                              ; preds = %85, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %60, label %115, label %152

115:                                              ; preds = %114
  %116 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 0), align 16, !tbaa !4
  %117 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 1), align 4, !tbaa !4
  %118 = fadd contract float %116, %117
  %119 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 2), align 8, !tbaa !4
  %120 = fadd contract float %118, %119
  %121 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 3), align 4, !tbaa !4
  %122 = fadd contract float %120, %121
  %123 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 4), align 16, !tbaa !4
  %124 = fadd contract float %122, %123
  %125 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 5), align 4, !tbaa !4
  %126 = fadd contract float %124, %125
  %127 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 6), align 8, !tbaa !4
  %128 = fadd contract float %126, %127
  %129 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 7), align 4, !tbaa !4
  %130 = fadd contract float %128, %129
  %131 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 8), align 16, !tbaa !4
  %132 = fadd contract float %130, %131
  %133 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 9), align 4, !tbaa !4
  %134 = fadd contract float %132, %133
  %135 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 10), align 8, !tbaa !4
  %136 = fadd contract float %134, %135
  %137 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 11), align 4, !tbaa !4
  %138 = fadd contract float %136, %137
  %139 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 12), align 16, !tbaa !4
  %140 = fadd contract float %138, %139
  %141 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 13), align 4, !tbaa !4
  %142 = fadd contract float %140, %141
  %143 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 14), align 8, !tbaa !4
  %144 = fadd contract float %142, %143
  %145 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ24updateOutputWithTargetMVPKfS0_S0_S0_S0_S0_S0_llllPfE6buffer, i32 0, i32 15), align 4, !tbaa !4
  %146 = fadd contract float %144, %145
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !4
  %149 = fadd contract float %146, %148
  %150 = sext i32 %78 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %18, i64 %150
  store float %149, float addrspace(1)* %151, align 4, !tbaa !4
  br label %152

152:                                              ; preds = %115, %114
  %153 = add nsw i32 %51, %78
  %154 = icmp slt i32 %153, %37
  br i1 %154, label %77, label %76, !llvm.loop !22
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !14, i64 12}
!10 = !{!"hsa_kernel_dispatch_packet_s", !11, i64 0, !11, i64 2, !11, i64 4, !11, i64 6, !11, i64 8, !11, i64 10, !14, i64 12, !14, i64 16, !14, i64 20, !14, i64 24, !14, i64 28, !15, i64 32, !16, i64 40, !15, i64 48, !17, i64 56}
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!"int", !12, i64 0}
!15 = !{!"long", !12, i64 0}
!16 = !{!"any pointer", !12, i64 0}
!17 = !{!"hsa_signal_s", !15, i64 0}
!18 = !{i16 1, i16 1025}
!19 = !{i32 0, i32 1024}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
