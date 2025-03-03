; ModuleID = '../data/hip_kernels/1232/14/main.cu'
source_filename = "../data/hip_kernels/1232/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16gussain_filter_zPfS_immmif(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i64 %3, i64 %4, i64 %5, i32 %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = zext i32 %17 to i64
  %19 = mul i64 %5, %4
  %20 = mul i64 %19, %3
  %21 = freeze i64 %18
  %22 = freeze i64 %5
  %23 = udiv i64 %21, %22
  %24 = mul i64 %23, %22
  %25 = sub i64 %21, %24
  %26 = urem i64 %23, %4
  %27 = udiv i64 %18, %19
  %28 = urem i64 %27, %3
  %29 = udiv i64 %18, %20
  %30 = icmp ult i64 %3, 2
  %31 = select i1 %30, i64 2, i64 3
  %32 = mul i64 %20, %31
  %33 = icmp ugt i64 %32, %18
  br i1 %33, label %34, label %121

34:                                               ; preds = %8
  %35 = icmp eq i32 %6, 0
  %36 = icmp slt i32 %2, 0
  br i1 %35, label %37, label %72

37:                                               ; preds = %34
  br i1 %36, label %46, label %38

38:                                               ; preds = %37
  %39 = sub nsw i32 0, %2
  %40 = trunc i64 %28 to i32
  %41 = add i64 %3, -1
  %42 = mul i64 %29, %20
  %43 = mul i64 %26, %5
  %44 = add i64 %43, %25
  %45 = add i64 %44, %42
  br label %49

46:                                               ; preds = %62, %37
  %47 = phi float [ 0.000000e+00, %37 ], [ %69, %62 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  store float %47, float addrspace(1)* %48, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %120

49:                                               ; preds = %38, %62
  %50 = phi i32 [ %39, %38 ], [ %70, %62 ]
  %51 = phi float [ 0.000000e+00, %38 ], [ %69, %62 ]
  %52 = add i32 %50, %40
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %62, label %54

54:                                               ; preds = %49
  %55 = zext i32 %52 to i64
  %56 = icmp ult i64 %41, %55
  br i1 %56, label %62, label %57

57:                                               ; preds = %54
  %58 = mul i64 %19, %55
  %59 = add i64 %45, %58
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %62

62:                                               ; preds = %49, %54, %57
  %63 = phi float [ %61, %57 ], [ %7, %54 ], [ %7, %49 ]
  %64 = add nsw i32 %50, %2
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fmul contract float %67, %63
  %69 = fadd contract float %51, %68
  %70 = add i32 %50, 1
  %71 = icmp eq i32 %50, %2
  br i1 %71, label %46, label %49, !llvm.loop !11

72:                                               ; preds = %34
  br i1 %36, label %83, label %73

73:                                               ; preds = %72
  %74 = sub nsw i32 0, %2
  %75 = trunc i64 %28 to i32
  %76 = shl nsw i32 %75, 1
  %77 = add nsw i32 %76, -2
  %78 = sub nsw i32 1, %75
  %79 = mul i64 %29, %20
  %80 = mul i64 %26, %5
  %81 = add i64 %80, %25
  %82 = add i64 %81, %79
  br label %86

83:                                               ; preds = %105, %72
  %84 = phi float [ 0.000000e+00, %72 ], [ %117, %105 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  store float %84, float addrspace(1)* %85, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %120

86:                                               ; preds = %73, %105
  %87 = phi i32 [ %74, %73 ], [ %118, %105 ]
  %88 = phi float [ 0.000000e+00, %73 ], [ %117, %105 ]
  %89 = add i32 %87, %75
  %90 = freeze i32 %89
  %91 = icmp slt i32 %90, 0
  br i1 %91, label %92, label %98

92:                                               ; preds = %86
  %93 = srem i32 %90, %77
  %94 = icmp sgt i32 %93, %78
  %95 = add nsw i32 %93, %77
  %96 = sub nsw i32 0, %93
  %97 = select i1 %94, i32 %96, i32 %95
  br label %105

98:                                               ; preds = %86
  %99 = icmp slt i32 %90, %75
  br i1 %99, label %105, label %100

100:                                              ; preds = %98
  %101 = srem i32 %90, %77
  %102 = icmp slt i32 %101, %75
  %103 = sub nsw i32 %77, %101
  %104 = select i1 %102, i32 %101, i32 %103
  br label %105

105:                                              ; preds = %92, %98, %100
  %106 = phi i32 [ %97, %92 ], [ %104, %100 ], [ %90, %98 ]
  %107 = add nsw i32 %87, %2
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = sext i32 %106 to i64
  %112 = mul i64 %19, %111
  %113 = add i64 %82, %112
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fmul contract float %110, %115
  %117 = fadd contract float %88, %116
  %118 = add i32 %87, 1
  %119 = icmp eq i32 %87, %2
  br i1 %119, label %83, label %86, !llvm.loop !13

120:                                              ; preds = %83, %46
  fence syncscope("workgroup") acquire
  br label %121

121:                                              ; preds = %120, %8
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
