; ModuleID = '../data/hip_kernels/686/20/main.cu'
source_filename = "../data/hip_kernels/686/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5xcorrPfS_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %8
  %25 = sub i32 %17, %5
  %26 = add i32 %25, 1
  %27 = sub i32 %24, %6
  %28 = add i32 %27, 1
  %29 = icmp sgt i32 %17, -1
  br i1 %29, label %30, label %139

30:                                               ; preds = %7
  %31 = add nsw i32 %5, -1
  %32 = add i32 %31, %3
  %33 = icmp slt i32 %17, %32
  %34 = icmp sgt i32 %24, -1
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %139

36:                                               ; preds = %30
  %37 = add nsw i32 %6, -1
  %38 = add i32 %37, %4
  %39 = icmp slt i32 %24, %38
  br i1 %39, label %40, label %139

40:                                               ; preds = %36
  %41 = icmp sgt i32 %5, 0
  br i1 %41, label %42, label %56

42:                                               ; preds = %40
  %43 = icmp sgt i32 %6, 0
  %44 = and i32 %6, 1
  %45 = icmp eq i32 %6, 1
  %46 = and i32 %6, -2
  %47 = icmp eq i32 %44, 0
  br label %48

48:                                               ; preds = %42, %87
  %49 = phi i32 [ 0, %42 ], [ %89, %87 ]
  %50 = phi float [ 0.000000e+00, %42 ], [ %88, %87 ]
  br i1 %43, label %51, label %87

51:                                               ; preds = %48
  %52 = add nsw i32 %26, %49
  %53 = icmp sgt i32 %52, -1
  %54 = icmp slt i32 %52, %3
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %45, label %62, label %91

56:                                               ; preds = %87, %40
  %57 = phi float [ 0.000000e+00, %40 ], [ %88, %87 ]
  %58 = mul nsw i32 %24, %32
  %59 = add nsw i32 %58, %17
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  store float %57, float addrspace(1)* %61, align 4, !tbaa !7
  br label %139

62:                                               ; preds = %134, %51
  %63 = phi float [ undef, %51 ], [ %135, %134 ]
  %64 = phi i32 [ 0, %51 ], [ %136, %134 ]
  %65 = phi float [ %50, %51 ], [ %135, %134 ]
  %66 = xor i1 %55, true
  %67 = select i1 %47, i1 true, i1 %66
  %68 = select i1 %47, float %63, float %65
  br i1 %67, label %87, label %69

69:                                               ; preds = %62
  %70 = add nsw i32 %28, %64
  %71 = icmp sgt i32 %70, -1
  %72 = icmp slt i32 %70, %4
  %73 = select i1 %71, i1 %72, i1 false
  br i1 %73, label %74, label %87

74:                                               ; preds = %69
  %75 = mul nsw i32 %70, %3
  %76 = add nsw i32 %75, %52
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  %80 = mul nsw i32 %64, %5
  %81 = add nsw i32 %80, %49
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = fmul contract float %79, %84
  %86 = fadd contract float %65, %85
  br label %87

87:                                               ; preds = %62, %74, %69, %48
  %88 = phi float [ %50, %48 ], [ %68, %62 ], [ %86, %74 ], [ %65, %69 ]
  %89 = add nuw nsw i32 %49, 1
  %90 = icmp eq i32 %89, %5
  br i1 %90, label %56, label %48, !llvm.loop !11

91:                                               ; preds = %51, %134
  %92 = phi i32 [ %136, %134 ], [ 0, %51 ]
  %93 = phi float [ %135, %134 ], [ %50, %51 ]
  %94 = phi i32 [ %137, %134 ], [ 0, %51 ]
  br i1 %55, label %95, label %113

95:                                               ; preds = %91
  %96 = add nsw i32 %28, %92
  %97 = icmp sgt i32 %96, -1
  %98 = icmp slt i32 %96, %4
  %99 = select i1 %97, i1 %98, i1 false
  br i1 %99, label %100, label %113

100:                                              ; preds = %95
  %101 = mul nsw i32 %96, %3
  %102 = add nsw i32 %101, %52
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = mul nsw i32 %92, %5
  %107 = add nsw i32 %106, %49
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %93, %111
  br label %113

113:                                              ; preds = %100, %95, %91
  %114 = phi float [ %112, %100 ], [ %93, %95 ], [ %93, %91 ]
  %115 = or i32 %92, 1
  br i1 %55, label %116, label %134

116:                                              ; preds = %113
  %117 = add nsw i32 %28, %115
  %118 = icmp sgt i32 %117, -1
  %119 = icmp slt i32 %117, %4
  %120 = select i1 %118, i1 %119, i1 false
  br i1 %120, label %121, label %134

121:                                              ; preds = %116
  %122 = mul nsw i32 %117, %3
  %123 = add nsw i32 %122, %52
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = mul nsw i32 %115, %5
  %128 = add nsw i32 %127, %49
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !6
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %114, %132
  br label %134

134:                                              ; preds = %121, %116, %113
  %135 = phi float [ %133, %121 ], [ %114, %116 ], [ %114, %113 ]
  %136 = add nuw nsw i32 %92, 2
  %137 = add i32 %94, 2
  %138 = icmp eq i32 %137, %46
  br i1 %138, label %62, label %91, !llvm.loop !13

139:                                              ; preds = %7, %30, %36, %56
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
