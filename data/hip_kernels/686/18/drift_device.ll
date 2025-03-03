; ModuleID = '../data/hip_kernels/686/18/main.cu'
source_filename = "../data/hip_kernels/686/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5driftPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %6
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %24 = sub i32 %15, %2
  %25 = add i32 %24, 1
  %26 = sub i32 %22, %3
  %27 = add i32 %26, 1
  %28 = icmp sgt i32 %15, -1
  br i1 %28, label %29, label %152

29:                                               ; preds = %5
  %30 = shl nsw i32 %2, 1
  %31 = add nsw i32 %30, -1
  %32 = icmp slt i32 %15, %31
  %33 = icmp sgt i32 %22, -1
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %152

35:                                               ; preds = %29
  %36 = shl nsw i32 %3, 1
  %37 = add nsw i32 %36, -1
  %38 = icmp slt i32 %22, %37
  %39 = add nsw i32 %4, -1
  %40 = icmp slt i32 %23, %39
  %41 = select i1 %38, i1 %40, i1 false
  br i1 %41, label %42, label %152

42:                                               ; preds = %35
  %43 = icmp sgt i32 %2, 0
  br i1 %43, label %44, label %61

44:                                               ; preds = %42
  %45 = icmp sgt i32 %3, 0
  %46 = mul i32 %23, %3
  %47 = add nsw i32 %23, 1
  %48 = mul i32 %47, %3
  %49 = and i32 %3, 1
  %50 = icmp eq i32 %3, 1
  %51 = and i32 %3, -2
  %52 = icmp eq i32 %49, 0
  br label %53

53:                                               ; preds = %44, %96
  %54 = phi i32 [ 0, %44 ], [ %98, %96 ]
  %55 = phi float [ 0.000000e+00, %44 ], [ %97, %96 ]
  br i1 %45, label %56, label %96

56:                                               ; preds = %53
  %57 = add nsw i32 %25, %54
  %58 = icmp sgt i32 %57, -1
  %59 = icmp slt i32 %57, %2
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %50, label %69, label %100

61:                                               ; preds = %96, %42
  %62 = phi float [ 0.000000e+00, %42 ], [ %97, %96 ]
  %63 = mul i32 %37, %23
  %64 = add i32 %22, %63
  %65 = mul i32 %64, %31
  %66 = add i32 %65, %15
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  store float %62, float addrspace(1)* %68, align 4, !tbaa !7
  br label %152

69:                                               ; preds = %147, %56
  %70 = phi float [ undef, %56 ], [ %148, %147 ]
  %71 = phi i32 [ 0, %56 ], [ %149, %147 ]
  %72 = phi float [ %55, %56 ], [ %148, %147 ]
  %73 = xor i1 %60, true
  %74 = select i1 %52, i1 true, i1 %73
  %75 = select i1 %52, float %70, float %72
  br i1 %74, label %96, label %76

76:                                               ; preds = %69
  %77 = add nsw i32 %27, %71
  %78 = icmp sgt i32 %77, -1
  %79 = icmp slt i32 %77, %3
  %80 = select i1 %78, i1 %79, i1 false
  br i1 %80, label %81, label %96

81:                                               ; preds = %76
  %82 = add i32 %77, %46
  %83 = mul i32 %82, %2
  %84 = add i32 %83, %57
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %88 = add i32 %71, %48
  %89 = mul i32 %88, %2
  %90 = add i32 %89, %54
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = fmul contract float %87, %93
  %95 = fadd contract float %72, %94
  br label %96

96:                                               ; preds = %69, %81, %76, %53
  %97 = phi float [ %55, %53 ], [ %75, %69 ], [ %95, %81 ], [ %72, %76 ]
  %98 = add nuw nsw i32 %54, 1
  %99 = icmp eq i32 %98, %2
  br i1 %99, label %61, label %53, !llvm.loop !11

100:                                              ; preds = %56, %147
  %101 = phi i32 [ %149, %147 ], [ 0, %56 ]
  %102 = phi float [ %148, %147 ], [ %55, %56 ]
  %103 = phi i32 [ %150, %147 ], [ 0, %56 ]
  br i1 %60, label %104, label %124

104:                                              ; preds = %100
  %105 = add nsw i32 %27, %101
  %106 = icmp sgt i32 %105, -1
  %107 = icmp slt i32 %105, %3
  %108 = select i1 %106, i1 %107, i1 false
  br i1 %108, label %109, label %124

109:                                              ; preds = %104
  %110 = add i32 %105, %46
  %111 = mul i32 %110, %2
  %112 = add i32 %111, %57
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !6
  %116 = add i32 %101, %48
  %117 = mul i32 %116, %2
  %118 = add i32 %117, %54
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fmul contract float %115, %121
  %123 = fadd contract float %102, %122
  br label %124

124:                                              ; preds = %109, %104, %100
  %125 = phi float [ %123, %109 ], [ %102, %104 ], [ %102, %100 ]
  %126 = or i32 %101, 1
  br i1 %60, label %127, label %147

127:                                              ; preds = %124
  %128 = add nsw i32 %27, %126
  %129 = icmp sgt i32 %128, -1
  %130 = icmp slt i32 %128, %3
  %131 = select i1 %129, i1 %130, i1 false
  br i1 %131, label %132, label %147

132:                                              ; preds = %127
  %133 = add i32 %128, %46
  %134 = mul i32 %133, %2
  %135 = add i32 %134, %57
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !6
  %139 = add i32 %126, %48
  %140 = mul i32 %139, %2
  %141 = add i32 %140, %54
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !6
  %145 = fmul contract float %138, %144
  %146 = fadd contract float %125, %145
  br label %147

147:                                              ; preds = %132, %127, %124
  %148 = phi float [ %146, %132 ], [ %125, %127 ], [ %125, %124 ]
  %149 = add nuw nsw i32 %101, 2
  %150 = add i32 %103, 2
  %151 = icmp eq i32 %150, %51
  br i1 %151, label %69, label %100, !llvm.loop !13

152:                                              ; preds = %5, %29, %35, %61
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
