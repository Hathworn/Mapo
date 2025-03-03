; ModuleID = '../data/hip_kernels/13913/15/main.cu'
source_filename = "../data/hip_kernels/13913/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12__embedmat2dPfPxiii(float addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = udiv i32 %14, %11
  %17 = mul i32 %16, %11
  %18 = icmp ugt i32 %14, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = mul i32 %20, %21
  %23 = add i32 %22, %15
  %24 = mul i32 %23, %11
  %25 = add i32 %24, %6
  %26 = mul nsw i32 %3, %2
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %44

28:                                               ; preds = %5
  %29 = icmp eq i32 %4, 0
  %30 = mul i32 %20, %11
  %31 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %32 = bitcast i8 addrspace(4)* %31 to i32 addrspace(4)*
  %33 = load i32, i32 addrspace(4)* %32, align 8, !tbaa !16
  %34 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %35 = bitcast i8 addrspace(4)* %34 to i16 addrspace(4)*
  %36 = load i16, i16 addrspace(4)* %35, align 2, !range !5, !invariant.load !6
  %37 = zext i16 %36 to i32
  %38 = udiv i32 %33, %37
  %39 = mul i32 %38, %37
  %40 = icmp ugt i32 %33, %39
  %41 = zext i1 %40 to i32
  %42 = add i32 %38, %41
  %43 = mul i32 %30, %42
  br label %45

44:                                               ; preds = %45, %5
  ret void

45:                                               ; preds = %28, %45
  %46 = phi i32 [ %25, %28 ], [ %64, %45 ]
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = bitcast float addrspace(1)* %48 to i32 addrspace(1)*
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !17, !amdgpu.noclobber !6
  %51 = and i32 %50, 2147483647
  %52 = sub nsw i32 0, %51
  %53 = icmp slt i32 %50, 0
  %54 = select i1 %53, i32 %52, i32 %50
  %55 = sdiv i32 %46, %2
  %56 = add nsw i32 %55, 1
  %57 = sub i32 %3, %55
  %58 = select i1 %29, i32 %56, i32 %57
  %59 = sext i32 %54 to i64
  %60 = zext i32 %58 to i64
  %61 = shl nuw i64 %60, 32
  %62 = add nsw i64 %61, %59
  %63 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %47
  store i64 %62, i64 addrspace(1)* %63, align 8, !tbaa !21
  %64 = add i32 %43, %46
  %65 = icmp slt i32 %64, %26
  br i1 %65, label %45, label %44, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"long long", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
