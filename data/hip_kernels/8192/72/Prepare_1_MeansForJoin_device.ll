; ModuleID = '../data/hip_kernels/8192/72/main.cu'
source_filename = "../data/hip_kernels/8192/72/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22Prepare_1_MeansForJoinPfiiiS_ii(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = mul nsw i32 %6, %5
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %115

30:                                               ; preds = %7
  %31 = freeze i32 %27
  %32 = freeze i32 %5
  %33 = sdiv i32 %31, %32
  %34 = mul i32 %33, %32
  %35 = sub i32 %31, %34
  %36 = shl nsw i32 %28, 2
  %37 = sext i32 %27 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !5
  %40 = fcmp contract ogt float %39, 0.000000e+00
  %41 = mul i32 %28, 5
  br i1 %40, label %42, label %93

42:                                               ; preds = %30
  %43 = mul i32 %41, %2
  %44 = add i32 %27, %36
  %45 = add i32 %44, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !5
  %49 = fcmp contract une float %48, 0.000000e+00
  %50 = mul i32 %41, %1
  %51 = add i32 %44, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %4, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16, !amdgpu.noclobber !5
  %55 = fcmp contract une float %54, 0.000000e+00
  %56 = select i1 %55, i1 true, i1 %49
  br i1 %56, label %57, label %93

57:                                               ; preds = %42
  %58 = sitofp i32 %35 to float
  %59 = fmul contract float %58, 2.000000e+00
  %60 = sitofp i32 %5 to float
  %61 = fdiv contract float %59, %60
  %62 = fadd contract float %61, -1.000000e+00
  %63 = sitofp i32 %33 to float
  %64 = fmul contract float %63, 2.000000e+00
  %65 = sitofp i32 %6 to float
  %66 = fdiv contract float %64, %65
  %67 = fadd contract float %66, -1.000000e+00
  %68 = fmul contract float %39, %62
  %69 = mul i32 %41, %3
  %70 = add i32 %27, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %4, i64 %71
  store float %68, float addrspace(1)* %72, align 4, !tbaa !16
  %73 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %74 = fmul contract float %67, %73
  %75 = add i32 %70, %28
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  store float %74, float addrspace(1)* %77, align 4, !tbaa !16
  %78 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %79 = fmul contract float %62, %78
  %80 = fmul contract float %62, %79
  %81 = shl nsw i32 %28, 1
  %82 = add i32 %70, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %4, i64 %83
  store float %80, float addrspace(1)* %84, align 4, !tbaa !16
  %85 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %86 = fmul contract float %67, %85
  %87 = fmul contract float %67, %86
  %88 = mul nsw i32 %28, 3
  %89 = add i32 %70, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %90
  store float %87, float addrspace(1)* %91, align 4, !tbaa !16
  %92 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  br label %109

93:                                               ; preds = %30, %42
  %94 = mul i32 %41, %3
  %95 = add i32 %27, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %4, i64 %96
  store float 0.000000e+00, float addrspace(1)* %97, align 4, !tbaa !16
  %98 = add i32 %95, %28
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %4, i64 %99
  store float 0.000000e+00, float addrspace(1)* %100, align 4, !tbaa !16
  %101 = shl nsw i32 %28, 1
  %102 = add i32 %95, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %4, i64 %103
  store float 0.000000e+00, float addrspace(1)* %104, align 4, !tbaa !16
  %105 = mul nsw i32 %28, 3
  %106 = add i32 %95, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %4, i64 %107
  store float 0.000000e+00, float addrspace(1)* %108, align 4, !tbaa !16
  br label %109

109:                                              ; preds = %93, %57
  %110 = phi i32 [ %70, %57 ], [ %95, %93 ]
  %111 = phi float [ %92, %57 ], [ 0.000000e+00, %93 ]
  %112 = add i32 %110, %36
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %4, i64 %113
  store float %111, float addrspace(1)* %114, align 4, !tbaa !16
  br label %115

115:                                              ; preds = %109, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
