; ModuleID = '../data/hip_kernels/2922/11/main.cu'
source_filename = "../data/hip_kernels/2922/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z10mandelbrotPiiiiii(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sdiv i32 %15, %3
  %17 = mul nsw i32 %16, %2
  %18 = sub nsw i32 %15, %17
  %19 = sub nsw i32 %5, %4
  %20 = icmp slt i32 %16, %19
  %21 = icmp slt i32 %18, %2
  %22 = select i1 %20, i1 %21, i1 false
  br i1 %22, label %23, label %67

23:                                               ; preds = %6
  %24 = sitofp i32 %18 to double
  %25 = fmul contract double %24, 4.000000e+00
  %26 = sitofp i32 %2 to double
  %27 = fdiv contract double %25, %26
  %28 = fadd contract double %27, -2.000000e+00
  %29 = fptrunc double %28 to float
  %30 = icmp sgt i32 %1, 0
  br i1 %30, label %31, label %61

31:                                               ; preds = %23
  %32 = add nsw i32 %16, %4
  %33 = sitofp i32 %32 to double
  %34 = fmul contract double %33, 4.000000e+00
  %35 = sitofp i32 %3 to double
  %36 = fdiv contract double %34, %35
  %37 = fadd contract double %36, -2.000000e+00
  %38 = fptrunc double %37 to float
  %39 = fpext float %38 to double
  br label %40

40:                                               ; preds = %31, %40
  %41 = phi i32 [ 0, %31 ], [ %44, %40 ]
  %42 = phi float [ 0.000000e+00, %31 ], [ %48, %40 ]
  %43 = phi float [ 0.000000e+00, %31 ], [ %54, %40 ]
  %44 = add nuw nsw i32 %41, 1
  %45 = fmul contract float %42, %42
  %46 = fmul contract float %43, %43
  %47 = fsub contract float %45, %46
  %48 = fadd contract float %47, %29
  %49 = fpext float %42 to double
  %50 = fmul contract double %49, 2.000000e+00
  %51 = fpext float %43 to double
  %52 = fmul contract double %50, %51
  %53 = fadd contract double %52, %39
  %54 = fptrunc double %53 to float
  %55 = fmul contract float %48, %48
  %56 = fmul contract float %54, %54
  %57 = fadd contract float %55, %56
  %58 = icmp slt i32 %44, %1
  %59 = fcmp contract ole float %57, 4.000000e+00
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %60, label %40, label %61, !llvm.loop !7

61:                                               ; preds = %40, %23
  %62 = phi i32 [ 0, %23 ], [ %44, %40 ]
  %63 = mul nsw i32 %16, %3
  %64 = add nsw i32 %18, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  store i32 %62, i32 addrspace(1)* %66, align 4, !tbaa !9
  br label %67

67:                                               ; preds = %61, %6
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
