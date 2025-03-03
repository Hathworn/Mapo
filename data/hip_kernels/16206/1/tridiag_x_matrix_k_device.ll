; ModuleID = '../data/hip_kernels/16206/1/main.cu'
source_filename = "../data/hip_kernels/16206/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sAds = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z18tridiag_x_matrix_kfffPfi(float %0, float %1, float %2, float addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = urem i32 %6, %4
  %8 = sub nsw i32 %6, %7
  %9 = freeze i32 %8
  %10 = urem i32 %9, %4
  %11 = sub nuw i32 %9, %10
  %12 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sAds, i32 0, i32 %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %6
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %3, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = getelementptr inbounds float, float addrspace(3)* %12, i32 %6
  store float %23, float addrspace(3)* %24, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp ne i32 %7, 0
  %26 = add nsw i32 %4, -1
  %27 = icmp slt i32 %7, %26
  %28 = select i1 %25, i1 %27, i1 false
  br i1 %28, label %29, label %39

29:                                               ; preds = %5
  %30 = add nsw i32 %7, -1
  %31 = getelementptr inbounds float, float addrspace(3)* %12, i32 %30
  %32 = load float, float addrspace(3)* %31, align 4, !tbaa !7
  %33 = fmul contract float %32, %0
  %34 = getelementptr inbounds float, float addrspace(3)* %12, i32 %7
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %36 = fmul contract float %35, %1
  %37 = fadd contract float %33, %36
  %38 = add nuw nsw i32 %7, 1
  br label %49

39:                                               ; preds = %5
  %40 = icmp eq i32 %7, 0
  br i1 %40, label %41, label %44

41:                                               ; preds = %39
  %42 = load float, float addrspace(3)* %12, align 4, !tbaa !7
  %43 = fmul contract float %42, %1
  br label %49

44:                                               ; preds = %39
  %45 = add nsw i32 %7, -1
  %46 = getelementptr inbounds float, float addrspace(3)* %12, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %48 = fmul contract float %47, %0
  br label %49

49:                                               ; preds = %41, %44, %29
  %50 = phi i32 [ 1, %41 ], [ %7, %44 ], [ %38, %29 ]
  %51 = phi float [ %2, %41 ], [ %1, %44 ], [ %2, %29 ]
  %52 = phi float [ %43, %41 ], [ %48, %44 ], [ %37, %29 ]
  %53 = getelementptr inbounds float, float addrspace(3)* %12, i32 %50
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %55 = fmul contract float %54, %51
  %56 = fadd contract float %52, %55
  store float %56, float addrspace(1)* %22, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
