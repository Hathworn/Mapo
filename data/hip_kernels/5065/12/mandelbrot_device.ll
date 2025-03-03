; ModuleID = '../data/hip_kernels/5065/12/main.cu'
source_filename = "../data/hip_kernels/5065/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z10mandelbrotPiiii(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sdiv i32 %13, %3
  %15 = mul nsw i32 %14, %2
  %16 = sub nsw i32 %13, %15
  %17 = icmp slt i32 %14, %3
  %18 = icmp slt i32 %16, %2
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %63

20:                                               ; preds = %4
  %21 = sitofp i32 %16 to double
  %22 = fmul contract double %21, 4.000000e+00
  %23 = sitofp i32 %2 to double
  %24 = fdiv contract double %22, %23
  %25 = fadd contract double %24, -2.000000e+00
  %26 = fptrunc double %25 to float
  %27 = icmp sgt i32 %1, 0
  br i1 %27, label %28, label %57

28:                                               ; preds = %20
  %29 = sitofp i32 %14 to double
  %30 = fmul contract double %29, 4.000000e+00
  %31 = sitofp i32 %3 to double
  %32 = fdiv contract double %30, %31
  %33 = fadd contract double %32, -2.000000e+00
  %34 = fptrunc double %33 to float
  %35 = fpext float %34 to double
  br label %36

36:                                               ; preds = %28, %36
  %37 = phi i32 [ 0, %28 ], [ %40, %36 ]
  %38 = phi float [ 0.000000e+00, %28 ], [ %44, %36 ]
  %39 = phi float [ 0.000000e+00, %28 ], [ %50, %36 ]
  %40 = add nuw nsw i32 %37, 1
  %41 = fmul contract float %38, %38
  %42 = fmul contract float %39, %39
  %43 = fsub contract float %41, %42
  %44 = fadd contract float %43, %26
  %45 = fpext float %38 to double
  %46 = fmul contract double %45, 2.000000e+00
  %47 = fpext float %39 to double
  %48 = fmul contract double %46, %47
  %49 = fadd contract double %48, %35
  %50 = fptrunc double %49 to float
  %51 = fmul contract float %44, %44
  %52 = fmul contract float %50, %50
  %53 = fadd contract float %51, %52
  %54 = icmp slt i32 %40, %1
  %55 = fcmp contract ole float %53, 4.000000e+00
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %36, label %57, !llvm.loop !7

57:                                               ; preds = %36, %20
  %58 = phi i32 [ 0, %20 ], [ %40, %36 ]
  %59 = mul nsw i32 %14, %3
  %60 = add nsw i32 %16, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  store i32 %58, i32 addrspace(1)* %62, align 4, !tbaa !9
  br label %63

63:                                               ; preds = %57, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
