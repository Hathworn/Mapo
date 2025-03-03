; ModuleID = '../data/hip_kernels/1513/21/main.cu'
source_filename = "../data/hip_kernels/1513/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23indices_offset_additionPlS_S_iE12smem_offsets = internal unnamed_addr addrspace(3) global [26 x i64] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23indices_offset_additionPlS_S_i(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp ult i32 %5, 26
  br i1 %6, label %7, label %12

7:                                                ; preds = %4
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %8
  %10 = load i64, i64 addrspace(1)* %9, align 8, !tbaa !5, !amdgpu.noclobber !9
  %11 = getelementptr inbounds [26 x i64], [26 x i64] addrspace(3)* @_ZZ23indices_offset_additionPlS_S_iE12smem_offsets, i32 0, i32 %5
  store i64 %10, i64 addrspace(3)* %11, align 8, !tbaa !5
  br label %12

12:                                               ; preds = %7, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !10, !invariant.load !9
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !11
  %22 = mul i32 %13, %18
  %23 = add i32 %22, %5
  %24 = mul nsw i32 %3, 26
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %33

26:                                               ; preds = %12
  %27 = udiv i32 %21, %18
  %28 = mul i32 %27, %18
  %29 = icmp ugt i32 %21, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %18
  br label %34

33:                                               ; preds = %34, %12
  ret void

34:                                               ; preds = %26, %34
  %35 = phi i32 [ %23, %26 ], [ %44, %34 ]
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %36
  %38 = load i64, i64 addrspace(1)* %37, align 8, !tbaa !5
  %39 = srem i32 %35, 26
  %40 = getelementptr inbounds [26 x i64], [26 x i64] addrspace(3)* @_ZZ23indices_offset_additionPlS_S_iE12smem_offsets, i32 0, i32 %39
  %41 = load i64, i64 addrspace(3)* %40, align 8, !tbaa !5
  %42 = add nsw i64 %41, %38
  %43 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %36
  store i64 %42, i64 addrspace(1)* %43, align 8, !tbaa !5
  %44 = add i32 %32, %35
  %45 = icmp slt i32 %44, %24
  br i1 %45, label %34, label %33, !llvm.loop !20
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
