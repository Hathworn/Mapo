; ModuleID = '../data/hip_kernels/1083/12/main.cu'
source_filename = "../data/hip_kernels/1083/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16gussain_filter_xPfS_immmif(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i64 %3, i64 %4, i64 %5, i32 %6, float %7) local_unnamed_addr #0 {
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
  br i1 %33, label %34, label %122

34:                                               ; preds = %8
  %35 = icmp eq i32 %6, 0
  %36 = icmp slt i32 %2, 0
  br i1 %35, label %37, label %72

37:                                               ; preds = %34
  br i1 %36, label %47, label %38

38:                                               ; preds = %37
  %39 = sub nsw i32 0, %2
  %40 = trunc i64 %25 to i32
  %41 = add i64 %5, -1
  %42 = mul i64 %29, %20
  %43 = mul i64 %28, %19
  %44 = mul i64 %26, %5
  %45 = add i64 %43, %44
  %46 = add i64 %45, %42
  br label %50

47:                                               ; preds = %62, %37
  %48 = phi float [ 0.000000e+00, %37 ], [ %69, %62 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  store float %48, float addrspace(1)* %49, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %121

50:                                               ; preds = %38, %62
  %51 = phi i32 [ %39, %38 ], [ %70, %62 ]
  %52 = phi float [ 0.000000e+00, %38 ], [ %69, %62 ]
  %53 = add i32 %51, %40
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %62, label %55

55:                                               ; preds = %50
  %56 = zext i32 %53 to i64
  %57 = icmp ult i64 %41, %56
  br i1 %57, label %62, label %58

58:                                               ; preds = %55
  %59 = add i64 %46, %56
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %62

62:                                               ; preds = %50, %55, %58
  %63 = phi float [ %61, %58 ], [ %7, %55 ], [ %7, %50 ]
  %64 = add nsw i32 %51, %2
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fmul contract float %67, %63
  %69 = fadd contract float %52, %68
  %70 = add i32 %51, 1
  %71 = icmp eq i32 %51, %2
  br i1 %71, label %47, label %50, !llvm.loop !11

72:                                               ; preds = %34
  br i1 %36, label %85, label %73

73:                                               ; preds = %72
  %74 = sub nsw i32 0, %2
  %75 = trunc i64 %25 to i32
  %76 = trunc i64 %5 to i32
  %77 = shl nsw i32 %76, 1
  %78 = add nsw i32 %77, -2
  %79 = sub nsw i32 1, %76
  %80 = mul i64 %29, %20
  %81 = mul i64 %28, %19
  %82 = mul i64 %26, %5
  %83 = add i64 %81, %82
  %84 = add i64 %83, %80
  br label %88

85:                                               ; preds = %107, %72
  %86 = phi float [ 0.000000e+00, %72 ], [ %118, %107 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  store float %86, float addrspace(1)* %87, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %121

88:                                               ; preds = %73, %107
  %89 = phi i32 [ %74, %73 ], [ %119, %107 ]
  %90 = phi float [ 0.000000e+00, %73 ], [ %118, %107 ]
  %91 = add i32 %89, %75
  %92 = freeze i32 %91
  %93 = icmp slt i32 %92, 0
  br i1 %93, label %94, label %100

94:                                               ; preds = %88
  %95 = srem i32 %92, %78
  %96 = icmp sgt i32 %95, %79
  %97 = add nsw i32 %95, %78
  %98 = sub nsw i32 0, %95
  %99 = select i1 %96, i32 %98, i32 %97
  br label %107

100:                                              ; preds = %88
  %101 = icmp slt i32 %92, %76
  br i1 %101, label %107, label %102

102:                                              ; preds = %100
  %103 = srem i32 %92, %78
  %104 = icmp slt i32 %103, %76
  %105 = sub nsw i32 %78, %103
  %106 = select i1 %104, i32 %103, i32 %105
  br label %107

107:                                              ; preds = %94, %100, %102
  %108 = phi i32 [ %99, %94 ], [ %106, %102 ], [ %92, %100 ]
  %109 = add nsw i32 %89, %2
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = sext i32 %108 to i64
  %114 = add i64 %84, %113
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract float %112, %116
  %118 = fadd contract float %90, %117
  %119 = add i32 %89, 1
  %120 = icmp eq i32 %89, %2
  br i1 %120, label %85, label %88, !llvm.loop !13

121:                                              ; preds = %85, %47
  fence syncscope("workgroup") acquire
  br label %122

122:                                              ; preds = %121, %8
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
