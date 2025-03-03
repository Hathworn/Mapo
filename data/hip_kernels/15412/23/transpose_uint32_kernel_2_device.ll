; ModuleID = '../data/hip_kernels/15412/23/main.cu'
source_filename = "../data/hip_kernels/15412/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ25transpose_uint32_kernel_2PjS_iiiiE3tmp = internal unnamed_addr addrspace(3) global [1056 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z25transpose_uint32_kernel_2PjS_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = srem i32 %3, 32
  %8 = add i32 %3, 32
  %9 = sub i32 %8, %7
  %10 = sdiv i32 %9, 32
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = and i32 %11, 31
  %13 = lshr i32 %11, 5
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = freeze i32 %14
  %16 = freeze i32 %10
  %17 = sdiv i32 %15, %16
  %18 = mul i32 %17, %16
  %19 = sub i32 %15, %18
  %20 = shl nsw i32 %19, 5
  %21 = or i32 %20, %12
  %22 = shl nsw i32 %17, 5
  %23 = or i32 %22, %13
  %24 = icmp slt i32 %21, %3
  %25 = icmp slt i32 %23, %2
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %33

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %4
  %29 = add nsw i32 %28, %21
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %33

33:                                               ; preds = %27, %6
  %34 = phi i32 [ %32, %27 ], [ 0, %6 ]
  %35 = mul nuw nsw i32 %12, 33
  %36 = add nuw nsw i32 %35, %13
  %37 = getelementptr inbounds [1056 x i32], [1056 x i32] addrspace(3)* @_ZZ25transpose_uint32_kernel_2PjS_iiiiE3tmp, i32 0, i32 %36
  store i32 %34, i32 addrspace(3)* %37, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = or i32 %22, %12
  %39 = or i32 %20, %13
  %40 = icmp slt i32 %38, %2
  %41 = icmp slt i32 %39, %3
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %43, label %53

43:                                               ; preds = %33
  %44 = mul nuw nsw i32 %13, 33
  %45 = add nuw nsw i32 %44, %12
  %46 = getelementptr inbounds [1056 x i32], [1056 x i32] addrspace(3)* @_ZZ25transpose_uint32_kernel_2PjS_iiiiE3tmp, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %48 = sdiv i32 %5, 32
  %49 = mul nsw i32 %39, %48
  %50 = add nsw i32 %49, %38
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  store i32 %47, i32 addrspace(1)* %52, align 4, !tbaa !5
  br label %53

53:                                               ; preds = %43, %33
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
