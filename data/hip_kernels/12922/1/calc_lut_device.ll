; ModuleID = '../data/hip_kernels/12922/1/main.cu'
source_filename = "../data/hip_kernels/12922/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8calc_lutPiS_iiE11shared_hist = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8calc_lutPiS_ii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %6
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5, !amdgpu.noclobber !9
  %9 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %5
  store i32 %8, i32 addrspace(3)* %9, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %10

10:                                               ; preds = %4, %10
  %11 = phi i32 [ 0, %4 ], [ %12, %10 ]
  %12 = add nuw nsw i32 %11, 1
  %13 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %11
  %14 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !5
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %10, label %16, !llvm.loop !10

16:                                               ; preds = %10
  %17 = add nuw nsw i32 %5, 1
  %18 = and i32 %17, 7
  %19 = icmp ult i32 %5, 7
  br i1 %19, label %60, label %20

20:                                               ; preds = %16
  %21 = and i32 %17, -8
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %57, %22 ]
  %24 = phi i32 [ 0, %20 ], [ %56, %22 ]
  %25 = phi i32 [ 0, %20 ], [ %58, %22 ]
  %26 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %23
  %27 = load i32, i32 addrspace(3)* %26, align 16, !tbaa !5
  %28 = add nsw i32 %27, %24
  %29 = or i32 %23, 1
  %30 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %29
  %31 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %32 = add nsw i32 %31, %28
  %33 = or i32 %23, 2
  %34 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %33
  %35 = load i32, i32 addrspace(3)* %34, align 8, !tbaa !5
  %36 = add nsw i32 %35, %32
  %37 = or i32 %23, 3
  %38 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %40 = add nsw i32 %39, %36
  %41 = or i32 %23, 4
  %42 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %41
  %43 = load i32, i32 addrspace(3)* %42, align 16, !tbaa !5
  %44 = add nsw i32 %43, %40
  %45 = or i32 %23, 5
  %46 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %48 = add nsw i32 %47, %44
  %49 = or i32 %23, 6
  %50 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %49
  %51 = load i32, i32 addrspace(3)* %50, align 8, !tbaa !5
  %52 = add nsw i32 %51, %48
  %53 = or i32 %23, 7
  %54 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %53
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !5
  %56 = add nsw i32 %55, %52
  %57 = add nuw nsw i32 %23, 8
  %58 = add i32 %25, 8
  %59 = icmp eq i32 %58, %21
  br i1 %59, label %60, label %22, !llvm.loop !12

60:                                               ; preds = %22, %16
  %61 = phi i32 [ undef, %16 ], [ %56, %22 ]
  %62 = phi i32 [ 0, %16 ], [ %57, %22 ]
  %63 = phi i32 [ 0, %16 ], [ %56, %22 ]
  %64 = icmp eq i32 %18, 0
  br i1 %64, label %75, label %65

65:                                               ; preds = %60, %65
  %66 = phi i32 [ %72, %65 ], [ %62, %60 ]
  %67 = phi i32 [ %71, %65 ], [ %63, %60 ]
  %68 = phi i32 [ %73, %65 ], [ 0, %60 ]
  %69 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %66
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !5
  %71 = add nsw i32 %70, %67
  %72 = add nuw nsw i32 %66, 1
  %73 = add i32 %68, 1
  %74 = icmp eq i32 %73, %18
  br i1 %74, label %75, label %65, !llvm.loop !13

75:                                               ; preds = %65, %60
  %76 = phi i32 [ %61, %60 ], [ %71, %65 ]
  %77 = sub nsw i32 %2, %14
  %78 = sitofp i32 %76 to float
  %79 = sitofp i32 %14 to float
  %80 = fsub contract float %78, %79
  %81 = fmul contract float %80, 2.550000e+02
  %82 = sitofp i32 %77 to float
  %83 = fdiv contract float %81, %82
  %84 = fpext float %83 to double
  %85 = fadd contract double %84, 5.000000e-01
  %86 = fptosi double %85 to i32
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %6
  %88 = tail call i32 @llvm.smax.i32(i32 %86, i32 0)
  store i32 %88, i32 addrspace(1)* %87, align 4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
