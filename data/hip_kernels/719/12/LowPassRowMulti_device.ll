; ModuleID = '../data/hip_kernels/719/12/main.cu'
source_filename = "../data/hip_kernels/719/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_Kernel = protected addrspace(4) externally_initialized global [192 x float] zeroinitializer, align 16
@_ZZ15LowPassRowMultiPfS_iiiE4data = internal unnamed_addr addrspace(3) global [168 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([192 x float] addrspace(4)* @d_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15LowPassRowMultiPfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = lshr i32 %7, 3
  %9 = and i32 %7, 7
  %10 = mul nsw i32 %8, 160
  %11 = add nuw nsw i32 %10, %6
  %12 = add nsw i32 %11, -4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = mul i32 %13, %3
  %15 = mul i32 %9, %3
  %16 = mul i32 %15, %4
  %17 = add i32 %14, %11
  %18 = add i32 %17, %16
  %19 = shl nuw nsw i32 %9, 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [192 x float], [192 x float] addrspace(4)* @d_Kernel, i64 0, i64 %20
  %22 = icmp ult i32 %11, 4
  br i1 %22, label %30, label %23

23:                                               ; preds = %5
  %24 = icmp slt i32 %12, %2
  br i1 %24, label %28, label %25

25:                                               ; preds = %23
  %26 = add nsw i32 %2, -1
  %27 = add i32 %26, %14
  br label %30

28:                                               ; preds = %23
  %29 = add nsw i32 %14, %12
  br label %30

30:                                               ; preds = %5, %25, %28
  %31 = phi i32 [ %27, %25 ], [ %29, %28 ], [ %14, %5 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %35 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %6
  store float %34, float addrspace(3)* %35, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp slt i32 %11, %2
  %37 = icmp ult i32 %6, 160
  %38 = and i1 %37, %36
  br i1 %38, label %39, label %90

39:                                               ; preds = %30
  %40 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %6
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %42 = add nuw nsw i32 %6, 8
  %43 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %45 = fadd contract float %41, %44
  %46 = load float, float addrspace(4)* %21, align 16, !tbaa !5
  %47 = fmul contract float %45, %46
  %48 = add nuw nsw i32 %6, 1
  %49 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %48
  %50 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %51 = add nuw nsw i32 %6, 7
  %52 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = fadd contract float %50, %53
  %55 = getelementptr inbounds float, float addrspace(4)* %21, i64 1
  %56 = load float, float addrspace(4)* %55, align 4, !tbaa !5
  %57 = fmul contract float %54, %56
  %58 = fadd contract float %47, %57
  %59 = add nuw nsw i32 %6, 2
  %60 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %62 = add nuw nsw i32 %6, 6
  %63 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %65 = fadd contract float %61, %64
  %66 = getelementptr inbounds float, float addrspace(4)* %21, i64 2
  %67 = load float, float addrspace(4)* %66, align 8, !tbaa !5
  %68 = fmul contract float %65, %67
  %69 = fadd contract float %58, %68
  %70 = add nuw nsw i32 %6, 3
  %71 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %73 = add nuw nsw i32 %6, 5
  %74 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = fadd contract float %72, %75
  %77 = getelementptr inbounds float, float addrspace(4)* %21, i64 3
  %78 = load float, float addrspace(4)* %77, align 4, !tbaa !5
  %79 = fmul contract float %76, %78
  %80 = fadd contract float %69, %79
  %81 = add nuw nsw i32 %6, 4
  %82 = getelementptr inbounds [168 x float], [168 x float] addrspace(3)* @_ZZ15LowPassRowMultiPfS_iiiE4data, i32 0, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %84 = getelementptr inbounds float, float addrspace(4)* %21, i64 4
  %85 = load float, float addrspace(4)* %84, align 16, !tbaa !5
  %86 = fmul contract float %83, %85
  %87 = fadd contract float %80, %86
  %88 = sext i32 %18 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  store float %87, float addrspace(1)* %89, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %39, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
