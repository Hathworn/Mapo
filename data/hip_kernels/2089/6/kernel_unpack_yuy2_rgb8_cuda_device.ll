; ModuleID = '../data/hip_kernels/2089/6/main.cu'
source_filename = "../data/hip_kernels/2089/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28kernel_unpack_yuy2_rgb8_cudaPKhPhi(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %8
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %11, %8
  %17 = mul i32 %16, %8
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %8
  %22 = icmp slt i32 %15, %2
  br i1 %22, label %23, label %106

23:                                               ; preds = %3, %23
  %24 = phi i32 [ %104, %23 ], [ %15, %3 ]
  %25 = shl nsw i32 %24, 2
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !16
  %29 = add nuw nsw i32 %25, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !16
  %33 = add nuw nsw i32 %25, 2
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !16
  %37 = add nuw nsw i32 %25, 3
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !16
  %41 = zext i8 %28 to i32
  %42 = zext i8 %32 to i32
  %43 = add nsw i32 %42, -128
  %44 = zext i8 %40 to i32
  %45 = mul nsw i32 %24, 6
  %46 = mul nuw nsw i32 %41, 298
  %47 = mul nuw nsw i32 %44, 409
  %48 = add nsw i32 %47, -52352
  %49 = add nsw i32 %46, -4640
  %50 = add nsw i32 %49, %48
  %51 = ashr i32 %50, 8
  %52 = tail call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = tail call i32 @llvm.smin.i32(i32 %52, i32 255)
  %54 = trunc i32 %53 to i8
  %55 = sext i32 %45 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %55
  store i8 %54, i8 addrspace(1)* %56, align 1, !tbaa !16
  %57 = mul nsw i32 %43, -100
  %58 = sub nsw i32 %57, %48
  %59 = add nsw i32 %49, %58
  %60 = ashr i32 %59, 8
  %61 = tail call i32 @llvm.smax.i32(i32 %60, i32 0)
  %62 = tail call i32 @llvm.smin.i32(i32 %61, i32 255)
  %63 = trunc i32 %62 to i8
  %64 = or i32 %45, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %65
  store i8 %63, i8 addrspace(1)* %66, align 1, !tbaa !16
  %67 = mul nsw i32 %43, 516
  %68 = add nsw i32 %49, %67
  %69 = ashr i32 %68, 8
  %70 = tail call i32 @llvm.smax.i32(i32 %69, i32 0)
  %71 = tail call i32 @llvm.smin.i32(i32 %70, i32 255)
  %72 = trunc i32 %71 to i8
  %73 = add nsw i32 %45, 2
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %74
  store i8 %72, i8 addrspace(1)* %75, align 1, !tbaa !16
  %76 = zext i8 %36 to i32
  %77 = mul nuw nsw i32 %76, 298
  %78 = add nsw i32 %77, -4640
  %79 = add nsw i32 %78, %48
  %80 = ashr i32 %79, 8
  %81 = tail call i32 @llvm.smax.i32(i32 %80, i32 0)
  %82 = tail call i32 @llvm.smin.i32(i32 %81, i32 255)
  %83 = trunc i32 %82 to i8
  %84 = add nsw i32 %45, 3
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %85
  store i8 %83, i8 addrspace(1)* %86, align 1, !tbaa !16
  %87 = add nsw i32 %78, %58
  %88 = ashr i32 %87, 8
  %89 = tail call i32 @llvm.smax.i32(i32 %88, i32 0)
  %90 = tail call i32 @llvm.smin.i32(i32 %89, i32 255)
  %91 = trunc i32 %90 to i8
  %92 = add nsw i32 %45, 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %93
  store i8 %91, i8 addrspace(1)* %94, align 1, !tbaa !16
  %95 = add nsw i32 %67, %77
  %96 = add nsw i32 %95, -4640
  %97 = ashr i32 %96, 8
  %98 = tail call i32 @llvm.smax.i32(i32 %97, i32 0)
  %99 = tail call i32 @llvm.smin.i32(i32 %98, i32 255)
  %100 = trunc i32 %99 to i8
  %101 = add nsw i32 %45, 5
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %102
  store i8 %100, i8 addrspace(1)* %103, align 1, !tbaa !16
  %104 = add nsw i32 %24, %21
  %105 = icmp slt i32 %104, %2
  br i1 %105, label %23, label %106, !llvm.loop !19

106:                                              ; preds = %23, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
