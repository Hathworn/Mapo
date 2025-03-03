; ModuleID = '../data/hip_kernels/59/164/main.cu'
source_filename = "../data/hip_kernels/59/164/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16kExtractPatches3PfS_S_S_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %8
  %30 = icmp slt i32 %28, %9
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %88

32:                                               ; preds = %11
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %34 = mul nsw i32 %10, %5
  %35 = icmp ult i32 %33, %34
  br i1 %35, label %36, label %88

36:                                               ; preds = %32
  %37 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 20
  %38 = bitcast i8 addrspace(4)* %37 to i32 addrspace(4)*
  %39 = load i32, i32 addrspace(4)* %38, align 4, !tbaa !7
  %40 = getelementptr i8, i8 addrspace(4)* %13, i64 8
  %41 = bitcast i8 addrspace(4)* %40 to i16 addrspace(4)*
  %42 = load i16, i16 addrspace(4)* %41, align 4, !range !4, !invariant.load !5
  %43 = zext i16 %42 to i32
  %44 = udiv i32 %39, %43
  %45 = mul i32 %44, %43
  %46 = icmp ugt i32 %39, %45
  %47 = zext i1 %46 to i32
  br label %48

48:                                               ; preds = %36, %48
  %49 = phi i32 [ %33, %36 ], [ %86, %48 ]
  %50 = freeze i32 %49
  %51 = freeze i32 %10
  %52 = udiv i32 %50, %51
  %53 = mul i32 %52, %51
  %54 = sub i32 %50, %53
  %55 = sext i32 %52 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = fptosi float %57 to i32
  %59 = add nsw i32 %28, %58
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = fptosi float %61 to i32
  %63 = add nsw i32 %20, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %55
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fcmp contract ogt float %65, 5.000000e-01
  %67 = xor i32 %63, -1
  %68 = add i32 %67, %6
  %69 = select i1 %66, i32 %68, i32 %63
  %70 = mul nsw i32 %52, %10
  %71 = add nsw i32 %70, %54
  %72 = mul nsw i32 %71, %7
  %73 = add nsw i32 %59, %72
  %74 = mul nsw i32 %73, %6
  %75 = add nsw i32 %69, %74
  %76 = sext i32 %75 to i64
  %77 = mul nsw i32 %71, %9
  %78 = add nsw i32 %77, %28
  %79 = mul nsw i32 %78, %8
  %80 = add nsw i32 %79, %20
  %81 = sext i32 %80 to i64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  store float %83, float addrspace(1)* %84, align 4, !tbaa !16
  %85 = add i32 %44, %49
  %86 = add i32 %85, %47
  %87 = icmp ult i32 %86, %34
  br i1 %87, label %48, label %88, !llvm.loop !20

88:                                               ; preds = %48, %32, %11
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !12, i64 20}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
