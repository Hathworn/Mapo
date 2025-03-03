; ModuleID = '../data/hip_kernels/7579/9/main.cu'
source_filename = "../data/hip_kernels/7579/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6matMulPdS_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 16
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 8, !tbaa !15
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %19 = udiv i32 %12, %9
  %20 = mul i32 %19, %9
  %21 = icmp ugt i32 %12, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %26 = mul nuw nsw i32 %25, %9
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %28 = bitcast i8 addrspace(4)* %14 to <2 x i16> addrspace(4)*
  %29 = load <2 x i16>, <2 x i16> addrspace(4)* %28, align 2, !invariant.load !5
  %30 = zext <2 x i16> %29 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = udiv i32 %17, %31
  %33 = mul i32 %32, %31
  %34 = icmp ugt i32 %17, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %18
  %38 = add i32 %37, %13
  %39 = mul i32 %38, %23
  %40 = add i32 %39, %5
  %41 = insertelement <2 x i32> poison, i32 %9, i64 0
  %42 = insertelement <2 x i32> %41, i32 %40, i64 1
  %43 = mul <2 x i32> %42, %30
  %44 = extractelement <2 x i32> %43, i64 1
  %45 = add i32 %44, %24
  %46 = extractelement <2 x i32> %43, i64 0
  %47 = mul i32 %46, %45
  %48 = add nuw nsw i32 %26, %27
  %49 = add i32 %48, %47
  %50 = shl nsw i32 %49, 16
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %2, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !17
  br label %55

54:                                               ; preds = %55
  ret void

55:                                               ; preds = %55, %3
  %56 = phi double [ %53, %3 ], [ %136, %55 ]
  %57 = phi i32 [ 0, %3 ], [ %137, %55 ]
  %58 = add nuw nsw i32 %57, %50
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !17
  %62 = zext i32 %57 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !17
  %65 = fmul contract double %61, %64
  %66 = fadd contract double %56, %65
  store double %66, double addrspace(1)* %52, align 8, !tbaa !17
  %67 = or i32 %57, 1
  %68 = add nuw nsw i32 %67, %50
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !17
  %72 = zext i32 %67 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %1, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !17
  %75 = fmul contract double %71, %74
  %76 = fadd contract double %66, %75
  store double %76, double addrspace(1)* %52, align 8, !tbaa !17
  %77 = or i32 %57, 2
  %78 = add nuw nsw i32 %77, %50
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %0, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !17
  %82 = zext i32 %77 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !17
  %85 = fmul contract double %81, %84
  %86 = fadd contract double %76, %85
  store double %86, double addrspace(1)* %52, align 8, !tbaa !17
  %87 = or i32 %57, 3
  %88 = add nuw nsw i32 %87, %50
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, double addrspace(1)* %0, i64 %89
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !17
  %92 = zext i32 %87 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %1, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !17
  %95 = fmul contract double %91, %94
  %96 = fadd contract double %86, %95
  store double %96, double addrspace(1)* %52, align 8, !tbaa !17
  %97 = or i32 %57, 4
  %98 = add nuw nsw i32 %97, %50
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %0, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !17
  %102 = zext i32 %97 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %1, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !17
  %105 = fmul contract double %101, %104
  %106 = fadd contract double %96, %105
  store double %106, double addrspace(1)* %52, align 8, !tbaa !17
  %107 = or i32 %57, 5
  %108 = add nuw nsw i32 %107, %50
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %0, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !17
  %112 = zext i32 %107 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %1, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !17
  %115 = fmul contract double %111, %114
  %116 = fadd contract double %106, %115
  store double %116, double addrspace(1)* %52, align 8, !tbaa !17
  %117 = or i32 %57, 6
  %118 = add nuw nsw i32 %117, %50
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %0, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !17
  %122 = zext i32 %117 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %1, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !17
  %125 = fmul contract double %121, %124
  %126 = fadd contract double %116, %125
  store double %126, double addrspace(1)* %52, align 8, !tbaa !17
  %127 = or i32 %57, 7
  %128 = add nuw nsw i32 %127, %50
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds double, double addrspace(1)* %0, i64 %129
  %131 = load double, double addrspace(1)* %130, align 8, !tbaa !17
  %132 = zext i32 %127 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %1, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !17
  %135 = fmul contract double %131, %134
  %136 = fadd contract double %126, %135
  store double %136, double addrspace(1)* %52, align 8, !tbaa !17
  %137 = add nuw nsw i32 %57, 8
  %138 = icmp eq i32 %137, 65536
  br i1 %138, label %54, label %55, !llvm.loop !21
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
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{!7, !11, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
