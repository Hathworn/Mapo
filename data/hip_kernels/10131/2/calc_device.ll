; ModuleID = '../data/hip_kernels/10131/2/main.cu'
source_filename = "../data/hip_kernels/10131/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4calcPfiiE3s_d = internal unnamed_addr addrspace(3) global [3072 x float] undef, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4calcPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 8, !tbaa !16
  %24 = mul i32 %16, %20
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %26 = add i32 %24, %25
  %27 = mul nuw nsw i32 %25, %9
  %28 = add nuw nsw i32 %27, %14
  %29 = mul nuw nsw i32 %28, 12
  %30 = udiv i32 %12, %9
  %31 = mul i32 %30, %9
  %32 = icmp ugt i32 %12, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %9
  %36 = udiv i32 %23, %20
  %37 = mul i32 %36, %20
  %38 = icmp ugt i32 %23, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %40, %20
  %42 = mul nsw i32 %2, %1
  %43 = mul nsw i32 %26, %1
  %44 = add nsw i32 %15, %42
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !17, !amdgpu.noclobber !5
  %48 = add nsw i32 %43, %15
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !17, !amdgpu.noclobber !5
  %52 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %29
  store float %51, float addrspace(3)* %52, align 16, !tbaa !17
  %53 = or i32 %29, 1
  %54 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %53
  store float %47, float addrspace(3)* %54, align 4, !tbaa !17
  %55 = add nsw i32 %43, %2
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !17
  %59 = or i32 %29, 2
  %60 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %59
  store float %58, float addrspace(3)* %60, align 8, !tbaa !17
  %61 = add nsw i32 %41, %26
  %62 = mul nsw i32 %61, %1
  %63 = add nsw i32 %62, %15
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !17, !amdgpu.noclobber !5
  %67 = or i32 %29, 3
  %68 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %67
  store float %66, float addrspace(3)* %68, align 4, !tbaa !17
  %69 = add nuw nsw i32 %29, 4
  %70 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %69
  store float %47, float addrspace(3)* %70, align 16, !tbaa !17
  %71 = add nsw i32 %62, %2
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !17
  %75 = add nuw nsw i32 %29, 5
  %76 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %75
  store float %74, float addrspace(3)* %76, align 4, !tbaa !17
  %77 = add nsw i32 %35, %15
  %78 = add nsw i32 %77, %42
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !17, !amdgpu.noclobber !5
  %82 = add nsw i32 %43, %77
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !17, !amdgpu.noclobber !5
  %86 = add nuw nsw i32 %29, 6
  %87 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %86
  store float %85, float addrspace(3)* %87, align 8, !tbaa !17
  %88 = add nuw nsw i32 %29, 7
  %89 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %88
  store float %81, float addrspace(3)* %89, align 4, !tbaa !17
  %90 = add nuw nsw i32 %29, 8
  %91 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %90
  store float %58, float addrspace(3)* %91, align 16, !tbaa !17
  %92 = add nsw i32 %62, %77
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !17, !amdgpu.noclobber !5
  %96 = add nuw nsw i32 %29, 9
  %97 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %96
  store float %95, float addrspace(3)* %97, align 4, !tbaa !17
  %98 = add nuw nsw i32 %29, 10
  %99 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %98
  store float %81, float addrspace(3)* %99, align 8, !tbaa !17
  %100 = add nuw nsw i32 %29, 11
  %101 = getelementptr inbounds [3072 x float], [3072 x float] addrspace(3)* @_ZZ4calcPfiiE3s_d, i32 0, i32 %100
  store float %74, float addrspace(3)* %101, align 4, !tbaa !17
  %102 = load float, float addrspace(3)* %52, align 16, !tbaa !17
  %103 = bitcast float addrspace(3)* %54 to <2 x float> addrspace(3)*
  %104 = load <2 x float>, <2 x float> addrspace(3)* %103, align 4, !tbaa !17
  %105 = extractelement <2 x float> %104, i64 0
  %106 = extractelement <2 x float> %104, i64 1
  %107 = fadd contract float %105, %106
  %108 = fcmp contract ogt float %102, %107
  br i1 %108, label %109, label %110

109:                                              ; preds = %3
  store float %107, float addrspace(3)* %52, align 16, !tbaa !17
  br label %110

110:                                              ; preds = %3, %109
  %111 = load float, float addrspace(3)* %68, align 4, !tbaa !17
  %112 = bitcast float addrspace(3)* %70 to <2 x float> addrspace(3)*
  %113 = load <2 x float>, <2 x float> addrspace(3)* %112, align 16, !tbaa !17
  %114 = extractelement <2 x float> %113, i64 0
  %115 = extractelement <2 x float> %113, i64 1
  %116 = fadd contract float %114, %115
  %117 = fcmp contract ogt float %111, %116
  br i1 %117, label %118, label %119

118:                                              ; preds = %110
  store float %116, float addrspace(3)* %68, align 4, !tbaa !17
  br label %119

119:                                              ; preds = %118, %110
  %120 = phi float [ %116, %118 ], [ %111, %110 ]
  %121 = load float, float addrspace(3)* %87, align 8, !tbaa !17
  %122 = bitcast float addrspace(3)* %89 to <2 x float> addrspace(3)*
  %123 = load <2 x float>, <2 x float> addrspace(3)* %122, align 4, !tbaa !17
  %124 = extractelement <2 x float> %123, i64 0
  %125 = extractelement <2 x float> %123, i64 1
  %126 = fadd contract float %124, %125
  %127 = fcmp contract ogt float %121, %126
  br i1 %127, label %128, label %129

128:                                              ; preds = %119
  store float %126, float addrspace(3)* %87, align 8, !tbaa !17
  br label %129

129:                                              ; preds = %128, %119
  %130 = phi float [ %126, %128 ], [ %121, %119 ]
  %131 = load float, float addrspace(3)* %97, align 4, !tbaa !17
  %132 = bitcast float addrspace(3)* %99 to <2 x float> addrspace(3)*
  %133 = load <2 x float>, <2 x float> addrspace(3)* %132, align 8, !tbaa !17
  %134 = extractelement <2 x float> %133, i64 0
  %135 = extractelement <2 x float> %133, i64 1
  %136 = fadd contract float %134, %135
  %137 = fcmp contract ogt float %131, %136
  br i1 %137, label %138, label %139

138:                                              ; preds = %129
  store float %136, float addrspace(3)* %97, align 4, !tbaa !17
  br label %139

139:                                              ; preds = %138, %129
  %140 = phi float [ %136, %138 ], [ %131, %129 ]
  %141 = load float, float addrspace(3)* %52, align 16, !tbaa !17
  store float %141, float addrspace(1)* %50, align 4, !tbaa !17
  store float %120, float addrspace(1)* %65, align 4, !tbaa !17
  store float %130, float addrspace(1)* %84, align 4, !tbaa !17
  store float %140, float addrspace(1)* %94, align 4, !tbaa !17
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
