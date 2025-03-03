; ModuleID = '../data/hip_kernels/7676/4/main.cu'
source_filename = "../data/hip_kernels/7676/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25getSufficientComponentNumPKdPmmd(double addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture %1, i64 %2, double %3) local_unnamed_addr #0 {
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %26, label %6

6:                                                ; preds = %4
  %7 = and i64 %2, 7
  %8 = icmp ult i64 %2, 8
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = and i64 %2, -8
  br label %34

11:                                               ; preds = %34, %6
  %12 = phi double [ undef, %6 ], [ %68, %34 ]
  %13 = phi i64 [ 0, %6 ], [ %69, %34 ]
  %14 = phi double [ 0.000000e+00, %6 ], [ %68, %34 ]
  %15 = icmp eq i64 %7, 0
  br i1 %15, label %26, label %16

16:                                               ; preds = %11, %16
  %17 = phi i64 [ %23, %16 ], [ %13, %11 ]
  %18 = phi double [ %22, %16 ], [ %14, %11 ]
  %19 = phi i64 [ %24, %16 ], [ 0, %11 ]
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 %17
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !4, !amdgpu.noclobber !8
  %22 = fadd contract double %18, %21
  %23 = add nuw i64 %17, 1
  %24 = add i64 %19, 1
  %25 = icmp eq i64 %24, %7
  br i1 %25, label %26, label %16, !llvm.loop !9

26:                                               ; preds = %11, %16, %4
  %27 = phi double [ 0.000000e+00, %4 ], [ %12, %11 ], [ %22, %16 ]
  %28 = uitofp i64 %2 to double
  %29 = fmul contract double %27, %28
  store i64 1, i64 addrspace(1)* %1, align 8, !tbaa !11
  %30 = add i64 %2, -1
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !4, !amdgpu.noclobber !8
  %33 = fmul contract double %32, %28
  br label %72

34:                                               ; preds = %34, %9
  %35 = phi i64 [ 0, %9 ], [ %69, %34 ]
  %36 = phi double [ 0.000000e+00, %9 ], [ %68, %34 ]
  %37 = phi i64 [ 0, %9 ], [ %70, %34 ]
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !4, !amdgpu.noclobber !8
  %40 = fadd contract double %36, %39
  %41 = or i64 %35, 1
  %42 = getelementptr inbounds double, double addrspace(1)* %0, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !4, !amdgpu.noclobber !8
  %44 = fadd contract double %40, %43
  %45 = or i64 %35, 2
  %46 = getelementptr inbounds double, double addrspace(1)* %0, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !4, !amdgpu.noclobber !8
  %48 = fadd contract double %44, %47
  %49 = or i64 %35, 3
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !4, !amdgpu.noclobber !8
  %52 = fadd contract double %48, %51
  %53 = or i64 %35, 4
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !4, !amdgpu.noclobber !8
  %56 = fadd contract double %52, %55
  %57 = or i64 %35, 5
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !4, !amdgpu.noclobber !8
  %60 = fadd contract double %56, %59
  %61 = or i64 %35, 6
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !4, !amdgpu.noclobber !8
  %64 = fadd contract double %60, %63
  %65 = or i64 %35, 7
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !4, !amdgpu.noclobber !8
  %68 = fadd contract double %64, %67
  %69 = add nuw i64 %35, 8
  %70 = add i64 %37, 8
  %71 = icmp eq i64 %70, %10
  br i1 %71, label %11, label %34, !llvm.loop !13

72:                                               ; preds = %79, %26
  %73 = phi i64 [ 1, %26 ], [ %86, %79 ]
  %74 = phi double [ %33, %26 ], [ %85, %79 ]
  %75 = fdiv contract double %74, %29
  %76 = icmp ult i64 %73, %2
  %77 = fcmp contract ole double %75, %3
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %79, label %87

79:                                               ; preds = %72
  %80 = xor i64 %73, -1
  %81 = add i64 %80, %2
  %82 = getelementptr inbounds double, double addrspace(1)* %0, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !4, !amdgpu.noclobber !8
  %84 = fmul contract double %83, %28
  %85 = fadd contract double %74, %84
  %86 = add nuw i64 %73, 1
  store i64 %86, i64 addrspace(1)* %1, align 8, !tbaa !11
  br label %72, !llvm.loop !15

87:                                               ; preds = %72
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
