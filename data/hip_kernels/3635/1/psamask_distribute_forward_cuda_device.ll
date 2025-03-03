; ModuleID = '../data/hip_kernels/3635/1/main.cu'
source_filename = "../data/hip_kernels/3635/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31psamask_distribute_forward_cudaiiiiiiiPKfPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %0
  br i1 %22, label %23, label %32

23:                                               ; preds = %9
  %24 = add nsw i32 %5, %1
  %25 = add nsw i32 %6, %2
  %26 = udiv i32 %18, %15
  %27 = mul i32 %26, %15
  %28 = icmp ugt i32 %18, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %15
  br label %33

32:                                               ; preds = %72, %9
  ret void

33:                                               ; preds = %23, %72
  %34 = phi i32 [ %21, %23 ], [ %73, %72 ]
  %35 = freeze i32 %34
  %36 = freeze i32 %2
  %37 = sdiv i32 %35, %36
  %38 = mul i32 %37, %36
  %39 = sub i32 %35, %38
  %40 = freeze i32 %1
  %41 = sdiv i32 %37, %40
  %42 = mul i32 %41, %40
  %43 = sub i32 %37, %42
  %44 = sub nsw i32 %5, %43
  %45 = tail call i32 @llvm.smax.i32(i32 %44, i32 0)
  %46 = sub i32 %24, %43
  %47 = tail call i32 @llvm.smin.i32(i32 %3, i32 %46)
  %48 = sub nsw i32 %6, %39
  %49 = tail call i32 @llvm.smax.i32(i32 %48, i32 0)
  %50 = sub i32 %25, %39
  %51 = tail call i32 @llvm.smin.i32(i32 %4, i32 %50)
  %52 = icmp slt i32 %45, %47
  br i1 %52, label %53, label %72

53:                                               ; preds = %33
  %54 = icmp slt i32 %49, %51
  %55 = mul nsw i32 %41, %3
  %56 = mul nsw i32 %41, %1
  %57 = add i32 %56, %43
  %58 = mul i32 %57, %2
  %59 = add nsw i32 %58, %39
  %60 = mul nsw i32 %59, %1
  %61 = sub i32 %43, %5
  %62 = add i32 %61, %60
  %63 = sub i32 %39, %6
  br label %64

64:                                               ; preds = %53, %75
  %65 = phi i32 [ %45, %53 ], [ %76, %75 ]
  br i1 %54, label %66, label %75

66:                                               ; preds = %64
  %67 = add i32 %65, %55
  %68 = mul i32 %67, %4
  %69 = add i32 %62, %65
  %70 = mul i32 %69, %2
  %71 = add i32 %63, %70
  br label %78

72:                                               ; preds = %75, %33
  %73 = add i32 %31, %34
  %74 = icmp slt i32 %73, %0
  br i1 %74, label %33, label %32, !llvm.loop !16

75:                                               ; preds = %78, %64
  %76 = add nuw nsw i32 %65, 1
  %77 = icmp slt i32 %76, %47
  br i1 %77, label %64, label %72, !llvm.loop !18

78:                                               ; preds = %66, %78
  %79 = phi i32 [ %49, %66 ], [ %91, %78 ]
  %80 = add nsw i32 %79, %68
  %81 = mul nsw i32 %80, %1
  %82 = add nsw i32 %81, %43
  %83 = mul nsw i32 %82, %2
  %84 = add nsw i32 %83, %39
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %7, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !19
  %88 = add i32 %71, %79
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %8, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !19
  %91 = add nuw nsw i32 %79, 1
  %92 = icmp slt i32 %91, %51
  br i1 %92, label %78, label %75, !llvm.loop !23
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !17}
