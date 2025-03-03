; ModuleID = '../data/hip_kernels/3557/40/main.cu'
source_filename = "../data/hip_kernels/3557/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30cudaSBilinearTF_Forward_kerneljjjjjjPKjS0_PKfS0_S0_S2_S2_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture writeonly %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 8
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %15, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %23 = add i32 %21, %22
  %24 = mul i32 %23, %2
  %25 = mul i32 %5, %4
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = icmp ult i32 %26, %2
  br i1 %27, label %28, label %48

28:                                               ; preds = %14
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %30 = icmp ult i32 %29, %1
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %32 = icmp ult i32 %31, %0
  %33 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4
  %36 = zext i16 %35 to i32
  %37 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %38 = bitcast i8 addrspace(4)* %37 to i16 addrspace(4)*
  %39 = load i16, i16 addrspace(4)* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %42 = bitcast i8 addrspace(4)* %41 to i32 addrspace(4)*
  %43 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %44 = udiv i32 %43, %36
  %45 = mul i32 %44, %36
  %46 = icmp ugt i32 %43, %45
  %47 = zext i1 %46 to i32
  br label %49

48:                                               ; preds = %56, %14
  ret void

49:                                               ; preds = %28, %56
  %50 = phi i32 [ %26, %28 ], [ %58, %56 ]
  br i1 %30, label %51, label %56

51:                                               ; preds = %49
  %52 = add i32 %50, %24
  %53 = mul i32 %25, %52
  %54 = add i32 %50, %24
  %55 = mul i32 %54, %1
  br label %60

56:                                               ; preds = %74, %49
  %57 = add i32 %44, %50
  %58 = add i32 %57, %47
  %59 = icmp ult i32 %58, %2
  br i1 %59, label %49, label %48, !llvm.loop !16

60:                                               ; preds = %51, %74
  %61 = phi i32 [ %29, %51 ], [ %75, %74 ]
  br i1 %32, label %62, label %74

62:                                               ; preds = %60
  %63 = zext i32 %61 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !18, !amdgpu.noclobber !5
  %66 = mul i32 %65, %4
  %67 = add i32 %53, %66
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %63
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !18, !amdgpu.noclobber !5
  %70 = mul i32 %69, %4
  %71 = getelementptr inbounds float, float addrspace(1)* %8, i64 %63
  %72 = add i32 %55, %61
  %73 = mul i32 %72, %0
  br label %77

74:                                               ; preds = %77, %60
  %75 = add i32 %61, %40
  %76 = icmp ult i32 %75, %1
  br i1 %76, label %60, label %56, !llvm.loop !22

77:                                               ; preds = %62, %77
  %78 = phi i32 [ %31, %62 ], [ %117, %77 ]
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !18, !amdgpu.noclobber !5
  %82 = add i32 %53, %81
  %83 = add i32 %82, %66
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %79
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !18, !amdgpu.noclobber !5
  %86 = add i32 %67, %85
  %87 = add i32 %82, %70
  %88 = add i32 %53, %85
  %89 = add i32 %88, %70
  %90 = zext i32 %83 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %12, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !23
  %93 = zext i32 %86 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %12, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !23
  %96 = zext i32 %87 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %12, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !23
  %99 = zext i32 %89 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %12, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !23
  %102 = fsub contract float %95, %92
  %103 = getelementptr inbounds float, float addrspace(1)* %11, i64 %79
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !23
  %105 = fmul contract float %102, %104
  %106 = fadd contract float %92, %105
  %107 = fsub contract float %101, %98
  %108 = fmul contract float %107, %104
  %109 = fadd contract float %98, %108
  %110 = fsub contract float %109, %106
  %111 = load float, float addrspace(1)* %71, align 4, !tbaa !23
  %112 = fmul contract float %111, %110
  %113 = fadd contract float %106, %112
  %114 = add i32 %78, %73
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %13, i64 %115
  store float %113, float addrspace(1)* %116, align 4, !tbaa !23
  %117 = add i32 %78, %36
  %118 = icmp ult i32 %117, %0
  br i1 %118, label %77, label %74, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !20, i64 0}
!25 = distinct !{!25, !17}
