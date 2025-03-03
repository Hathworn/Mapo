; ModuleID = '../data/hip_kernels/16206/2/main.cu'
source_filename = "../data/hip_kernels/16206/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sAds = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z18tridiag_x_matrix_kPfS_S_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = freeze i32 %6
  %8 = freeze i32 %4
  %9 = udiv i32 %7, %8
  %10 = mul i32 %9, %8
  %11 = sub i32 %7, %10
  %12 = shl i32 %4, 2
  %13 = mul i32 %12, %9
  %14 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sAds, i32 0, i32 %13
  %15 = getelementptr inbounds float, float addrspace(3)* %14, i32 %4
  %16 = getelementptr inbounds float, float addrspace(3)* %15, i32 %4
  %17 = getelementptr inbounds float, float addrspace(3)* %16, i32 %4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = add i32 %24, %6
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = getelementptr inbounds float, float addrspace(3)* %14, i32 %6
  store float %28, float addrspace(3)* %29, align 4, !tbaa !7
  %30 = zext i32 %11 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = getelementptr inbounds float, float addrspace(3)* %15, i32 %6
  store float %32, float addrspace(3)* %33, align 4, !tbaa !7
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = getelementptr inbounds float, float addrspace(3)* %16, i32 %6
  store float %35, float addrspace(3)* %36, align 4, !tbaa !7
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds float, float addrspace(3)* %17, i32 %6
  store float %38, float addrspace(3)* %39, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ne i32 %11, 0
  %41 = add nsw i32 %4, -1
  %42 = icmp slt i32 %11, %41
  %43 = select i1 %40, i1 %42, i1 false
  br i1 %43, label %44, label %59

44:                                               ; preds = %5
  %45 = getelementptr inbounds float, float addrspace(3)* %15, i32 %11
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %47 = add nsw i32 %11, -1
  %48 = getelementptr inbounds float, float addrspace(3)* %14, i32 %47
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %50 = fmul contract float %46, %49
  %51 = getelementptr inbounds float, float addrspace(3)* %16, i32 %11
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %53 = getelementptr inbounds float, float addrspace(3)* %14, i32 %11
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %55 = fmul contract float %52, %54
  %56 = fadd contract float %50, %55
  %57 = getelementptr inbounds float, float addrspace(3)* %17, i32 %11
  %58 = add nuw nsw i32 %11, 1
  br label %73

59:                                               ; preds = %5
  %60 = icmp eq i32 %11, 0
  br i1 %60, label %61, label %65

61:                                               ; preds = %59
  %62 = load float, float addrspace(3)* %16, align 4, !tbaa !7
  %63 = load float, float addrspace(3)* %14, align 4, !tbaa !7
  %64 = fmul contract float %62, %63
  br label %73

65:                                               ; preds = %59
  %66 = getelementptr inbounds float, float addrspace(3)* %15, i32 %11
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %68 = add nsw i32 %11, -1
  %69 = getelementptr inbounds float, float addrspace(3)* %14, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %71 = fmul contract float %67, %70
  %72 = getelementptr inbounds float, float addrspace(3)* %16, i32 %11
  br label %73

73:                                               ; preds = %61, %65, %44
  %74 = phi i32 [ 1, %61 ], [ %11, %65 ], [ %58, %44 ]
  %75 = phi float addrspace(3)* [ %17, %61 ], [ %72, %65 ], [ %57, %44 ]
  %76 = phi float [ %64, %61 ], [ %71, %65 ], [ %56, %44 ]
  %77 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %78 = getelementptr inbounds float, float addrspace(3)* %14, i32 %74
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %80 = fmul contract float %77, %79
  %81 = fadd contract float %76, %80
  store float %81, float addrspace(1)* %27, align 4, !tbaa !7
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
