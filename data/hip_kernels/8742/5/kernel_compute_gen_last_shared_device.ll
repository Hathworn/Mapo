; ModuleID = '../data/hip_kernels/8742/5/main.cu'
source_filename = "../data/hip_kernels/8742/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared = internal unnamed_addr addrspace(3) global [3 x [130 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z30kernel_compute_gen_last_sharedPhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = add nsw i32 %9, -2
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = add i32 %3, -1
  %16 = and i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = add i32 %2, -1
  %21 = and i32 %20, %19
  %22 = mul i32 %21, %3
  %23 = add i32 %16, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %24
  %26 = load i8, i8 addrspace(1)* %25, align 1, !tbaa !7, !amdgpu.noclobber !5
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 %18, i32 %13
  store i32 %27, i32 addrspace(3)* %28, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = icmp eq i32 %18, 1
  %30 = icmp ne i32 %13, 0
  %31 = select i1 %29, i1 %30, i1 false
  %32 = icmp ult i32 %13, 129
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %68

34:                                               ; preds = %4
  %35 = getelementptr [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 2, i32 %13
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !10
  %37 = getelementptr inbounds [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 0, i32 %13
  %38 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !10
  %39 = add nsw i32 %38, %36
  %40 = add nuw nsw i32 %13, 1
  %41 = getelementptr inbounds [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 1, i32 %40
  %42 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !10
  %43 = add nsw i32 %39, %42
  %44 = add nsw i32 %13, -1
  %45 = getelementptr inbounds [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 1, i32 %44
  %46 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !10
  %47 = add nsw i32 %43, %46
  %48 = getelementptr [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 2, i32 %40
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !10
  %50 = add nsw i32 %47, %49
  %51 = getelementptr inbounds [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 0, i32 %44
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !10
  %53 = add nsw i32 %50, %52
  %54 = getelementptr inbounds [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 0, i32 %40
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !10
  %56 = add nsw i32 %53, %55
  %57 = getelementptr [3 x [130 x i32]], [3 x [130 x i32]] addrspace(3)* @_ZZ30kernel_compute_gen_last_sharedPhS_jjE6shared, i32 0, i32 2, i32 %44
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !10
  %59 = add nsw i32 %56, %58
  %60 = and i32 %59, 255
  %61 = icmp eq i32 %60, 3
  %62 = icmp eq i32 %60, 2
  %63 = icmp ne i8 %26, 0
  %64 = select i1 %62, i1 %63, i1 false
  %65 = select i1 %61, i1 true, i1 %64
  %66 = zext i1 %65 to i8
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %24
  store i8 %66, i8 addrspace(1)* %67, align 1, !tbaa !7
  br label %68

68:                                               ; preds = %34, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
