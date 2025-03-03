; ModuleID = '../data/hip_kernels/3563/0/main.cu'
source_filename = "../data/hip_kernels/3563/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20graph_determ_weightsPjS_PfjjS0_S0_jfPi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, float %8, i32 addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = add i32 %19, 1234
  %21 = xor i32 %20, 746559103
  %22 = mul i32 %21, 1228688033
  %23 = icmp ult i32 %19, %3
  br i1 %23, label %24, label %105

24:                                               ; preds = %10
  %25 = zext i32 %19 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = add nuw i32 %19, 1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = icmp ult i32 %27, %31
  br i1 %32, label %33, label %105

33:                                               ; preds = %24
  %34 = add i32 %22, 123456789
  %35 = xor i32 %22, 362436069
  %36 = add i32 %22, 5783321
  %37 = add i32 %22, -1966976488
  %38 = add i32 %7, 1
  %39 = icmp ugt i32 %38, 1
  br label %40

40:                                               ; preds = %33, %91
  %41 = phi i32 [ %27, %33 ], [ %102, %91 ]
  %42 = phi i32 [ %37, %33 ], [ %98, %91 ]
  %43 = phi i32 [ %36, %33 ], [ %97, %91 ]
  %44 = phi i32 [ -1894485380, %33 ], [ %96, %91 ]
  %45 = phi i32 [ -1452303100, %33 ], [ %95, %91 ]
  %46 = phi i32 [ %34, %33 ], [ %94, %91 ]
  %47 = phi i32 [ %35, %33 ], [ %93, %91 ]
  %48 = sext i32 %41 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !11, !amdgpu.noclobber !5
  %51 = fmul contract float %50, %8
  %52 = fpext float %51 to double
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %48
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %5, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11, !amdgpu.noclobber !5
  %58 = fpext float %57 to double
  %59 = fsub contract double 1.000000e+00, %58
  %60 = fmul contract double %59, %52
  %61 = fptrunc double %60 to float
  br i1 %39, label %62, label %91

62:                                               ; preds = %40, %88
  %63 = phi i32 [ %89, %88 ], [ 1, %40 ]
  %64 = phi i32 [ %77, %88 ], [ %42, %40 ]
  %65 = phi i32 [ %76, %88 ], [ %43, %40 ]
  %66 = phi i32 [ %65, %88 ], [ %44, %40 ]
  %67 = phi i32 [ %66, %88 ], [ %45, %40 ]
  %68 = phi i32 [ %69, %88 ], [ %46, %40 ]
  %69 = phi i32 [ %67, %88 ], [ %47, %40 ]
  %70 = lshr i32 %68, 2
  %71 = xor i32 %70, %68
  %72 = shl i32 %65, 4
  %73 = shl i32 %71, 1
  %74 = xor i32 %73, %72
  %75 = xor i32 %74, %71
  %76 = xor i32 %75, %65
  %77 = add i32 %64, 362437
  %78 = add i32 %76, %77
  %79 = uitofp i32 %78 to float
  %80 = fmul contract float %79, 0x3DF0000000000000
  %81 = fadd contract float %80, 0x3DF0000000000000
  %82 = add nsw i32 %63, -1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11, !amdgpu.noclobber !5
  %86 = fmul contract float %85, %61
  %87 = fcmp contract olt float %81, %86
  br i1 %87, label %91, label %88

88:                                               ; preds = %62
  %89 = add nuw i32 %63, 1
  %90 = icmp eq i32 %63, %7
  br i1 %90, label %91, label %62, !llvm.loop !13

91:                                               ; preds = %88, %62, %40
  %92 = phi i32 [ 1, %40 ], [ %38, %88 ], [ %63, %62 ]
  %93 = phi i32 [ %47, %40 ], [ %67, %62 ], [ %67, %88 ]
  %94 = phi i32 [ %46, %40 ], [ %69, %62 ], [ %69, %88 ]
  %95 = phi i32 [ %45, %40 ], [ %66, %62 ], [ %66, %88 ]
  %96 = phi i32 [ %44, %40 ], [ %65, %62 ], [ %65, %88 ]
  %97 = phi i32 [ %43, %40 ], [ %76, %62 ], [ %76, %88 ]
  %98 = phi i32 [ %42, %40 ], [ %77, %62 ], [ %77, %88 ]
  %99 = icmp ugt i32 %92, %7
  %100 = select i1 %99, i32 -1, i32 %92
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %48
  store i32 %100, i32 addrspace(1)* %101, align 4, !tbaa !7
  %102 = add nuw nsw i32 %41, 1
  %103 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %104 = icmp ult i32 %102, %103
  br i1 %104, label %40, label %105, !llvm.loop !15

105:                                              ; preds = %91, %24, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
