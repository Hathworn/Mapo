; ModuleID = '../data/hip_kernels/13913/58/main.cu'
source_filename = "../data/hip_kernels/13913/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13__radixcountsPdiiPjE2ic = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13__radixcountsPdiiPj(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #1 {
  %5 = alloca double, align 8, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = zext i32 %6 to i64
  %8 = sext i32 %1 to i64
  %9 = mul nsw i64 %8, %7
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = zext i32 %22 to i64
  %24 = sdiv i64 %9, %23
  %25 = trunc i64 %24 to i32
  %26 = add i32 %6, 1
  %27 = zext i32 %26 to i64
  %28 = mul nsw i64 %8, %27
  %29 = sdiv i64 %28, %23
  %30 = trunc i64 %29 to i32
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %32 = icmp slt i32 %25, %30
  br i1 %32, label %33, label %40

33:                                               ; preds = %4
  %34 = sdiv i32 %25, 4096
  %35 = add i32 %34, %6
  %36 = shl i32 %35, 8
  %37 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ13__radixcountsPdiiPjE2ic, i32 0, i32 %31
  %38 = bitcast double addrspace(5)* %5 to i8 addrspace(5)*
  %39 = getelementptr inbounds i8, i8 addrspace(5)* %38, i32 %2
  br label %41

40:                                               ; preds = %48, %4
  ret void

41:                                               ; preds = %33, %48
  %42 = phi i32 [ %36, %33 ], [ %53, %48 ]
  %43 = phi i32 [ %25, %33 ], [ %54, %48 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add nsw i32 %43, %31
  %45 = add nsw i32 %44, 4096
  %46 = tail call i32 @llvm.smin.i32(i32 %30, i32 %45)
  %47 = icmp slt i32 %44, %46
  br i1 %47, label %56, label %48

48:                                               ; preds = %56, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !16
  %50 = add i32 %42, %31
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %51
  store i32 %49, i32 addrspace(1)* %52, align 4, !tbaa !16
  %53 = add nsw i32 %42, 256
  %54 = add nsw i32 %43, 4096
  %55 = icmp slt i32 %54, %30
  br i1 %55, label %41, label %40, !llvm.loop !20

56:                                               ; preds = %41, %56
  %57 = phi i32 [ %65, %56 ], [ %44, %41 ]
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %0, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !22
  store double %60, double addrspace(5)* %5, align 8, !tbaa !22
  %61 = load i8, i8 addrspace(5)* %39, align 1, !tbaa !24
  %62 = zext i8 %61 to i32
  %63 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ13__radixcountsPdiiPjE2ic, i32 0, i32 %62
  %64 = tail call i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* %63, i32 2147418112, i32 2, i32 4, i1 false)
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %65 = add nsw i32 %57, 256
  %66 = icmp slt i32 %65, %46
  br i1 %66, label %56, label %48, !llvm.loop !25
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #5

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"double", !18, i64 0}
!24 = !{!18, !18, i64 0}
!25 = distinct !{!25, !21}
