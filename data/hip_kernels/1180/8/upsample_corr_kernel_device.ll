; ModuleID = '../data/hip_kernels/1180/8/main.cu'
source_filename = "../data/hip_kernels/1180/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20upsample_corr_kernelPiS_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = mul nsw i32 %5, %4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %84

18:                                               ; preds = %6
  %19 = freeze i32 %15
  %20 = freeze i32 %5
  %21 = sdiv i32 %19, %20
  %22 = mul i32 %21, %20
  %23 = sub i32 %19, %22
  %24 = sitofp i32 %5 to float
  %25 = sitofp i32 %3 to float
  %26 = fdiv contract float %24, %25
  %27 = sitofp i32 %4 to float
  %28 = sitofp i32 %2 to float
  %29 = fdiv contract float %27, %28
  %30 = sitofp i32 %23 to double
  %31 = fadd contract double %30, 5.000000e-01
  %32 = fpext float %26 to double
  %33 = fdiv contract double %31, %32
  %34 = fptosi double %33 to i32
  %35 = sitofp i32 %21 to double
  %36 = fadd contract double %35, 5.000000e-01
  %37 = fpext float %29 to double
  %38 = fdiv contract double %36, %37
  %39 = fptosi double %38 to i32
  %40 = add nsw i32 %3, -1
  %41 = tail call i32 @llvm.smin.i32(i32 %40, i32 %34)
  %42 = tail call i32 @llvm.smax.i32(i32 %41, i32 0)
  %43 = add nsw i32 %2, -1
  %44 = tail call i32 @llvm.smin.i32(i32 %43, i32 %39)
  %45 = tail call i32 @llvm.smax.i32(i32 %44, i32 0)
  %46 = mul nsw i32 %45, %3
  %47 = add nsw i32 %46, %42
  %48 = shl nsw i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = add nuw nsw i32 %48, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = sitofp i32 %23 to float
  %57 = sub nsw i32 %51, %42
  %58 = sitofp i32 %57 to float
  %59 = fmul contract float %26, %58
  %60 = fadd contract float %59, %56
  %61 = fpext float %60 to double
  %62 = fadd contract double %61, 5.000000e-01
  %63 = fptosi double %62 to i32
  %64 = sitofp i32 %21 to float
  %65 = sub nsw i32 %55, %45
  %66 = sitofp i32 %65 to float
  %67 = fmul contract float %29, %66
  %68 = fadd contract float %67, %64
  %69 = fpext float %68 to double
  %70 = fadd contract double %69, 5.000000e-01
  %71 = fptosi double %70 to i32
  %72 = add nsw i32 %5, -1
  %73 = tail call i32 @llvm.smin.i32(i32 %72, i32 %63)
  %74 = tail call i32 @llvm.smax.i32(i32 %73, i32 0)
  %75 = add nsw i32 %4, -1
  %76 = tail call i32 @llvm.smin.i32(i32 %75, i32 %71)
  %77 = tail call i32 @llvm.smax.i32(i32 %76, i32 0)
  %78 = shl nsw i32 %15, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  store i32 %74, i32 addrspace(1)* %80, align 4, !tbaa !7
  %81 = add nuw nsw i32 %78, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  store i32 %77, i32 addrspace(1)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %18, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
