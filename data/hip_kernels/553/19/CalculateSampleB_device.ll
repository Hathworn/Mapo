; ModuleID = '../data/hip_kernels/553/19/main.cu'
source_filename = "../data/hip_kernels/553/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16CalculateSampleBPKfPfiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %16, %4
  %26 = add nsw i32 %25, %24
  %27 = icmp slt i32 %16, %5
  %28 = icmp slt i32 %24, %4
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %168

30:                                               ; preds = %7
  %31 = mul nsw i32 %16, %6
  %32 = mul nsw i32 %24, %6
  %33 = icmp sgt i32 %6, 0
  br i1 %33, label %34, label %48

34:                                               ; preds = %30
  %35 = and i32 %6, 1
  %36 = icmp eq i32 %6, 1
  %37 = and i32 %6, -2
  %38 = icmp eq i32 %35, 0
  br label %39

39:                                               ; preds = %34, %98
  %40 = phi i32 [ %102, %98 ], [ 0, %34 ]
  %41 = phi i32 [ %103, %98 ], [ 0, %34 ]
  %42 = phi float [ %101, %98 ], [ 0.000000e+00, %34 ]
  %43 = phi float [ %100, %98 ], [ 0.000000e+00, %34 ]
  %44 = phi float [ %99, %98 ], [ 0.000000e+00, %34 ]
  %45 = add nsw i32 %41, %31
  %46 = icmp slt i32 %45, %3
  %47 = mul nsw i32 %45, %2
  br i1 %36, label %66, label %105

48:                                               ; preds = %98, %30
  %49 = phi float [ 0.000000e+00, %30 ], [ %99, %98 ]
  %50 = phi float [ 0.000000e+00, %30 ], [ %100, %98 ]
  %51 = phi float [ 0.000000e+00, %30 ], [ %101, %98 ]
  %52 = phi i32 [ 0, %30 ], [ %102, %98 ]
  %53 = sitofp i32 %52 to float
  %54 = fdiv contract float %49, %53
  %55 = mul nsw i32 %26, 3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  store float %54, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = fdiv contract float %50, %53
  %59 = add nsw i32 %55, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  store float %58, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = fdiv contract float %51, %53
  %63 = add nsw i32 %55, 2
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  store float %62, float addrspace(1)* %65, align 4, !tbaa !7
  br label %168

66:                                               ; preds = %160, %39
  %67 = phi float [ undef, %39 ], [ %161, %160 ]
  %68 = phi float [ undef, %39 ], [ %162, %160 ]
  %69 = phi float [ undef, %39 ], [ %163, %160 ]
  %70 = phi i32 [ undef, %39 ], [ %164, %160 ]
  %71 = phi i32 [ %40, %39 ], [ %164, %160 ]
  %72 = phi i32 [ 0, %39 ], [ %165, %160 ]
  %73 = phi float [ %42, %39 ], [ %163, %160 ]
  %74 = phi float [ %43, %39 ], [ %162, %160 ]
  %75 = phi float [ %44, %39 ], [ %161, %160 ]
  br i1 %38, label %98, label %76

76:                                               ; preds = %66
  br i1 %46, label %77, label %98

77:                                               ; preds = %76
  %78 = add nsw i32 %72, %32
  %79 = icmp slt i32 %78, %2
  br i1 %79, label %80, label %98

80:                                               ; preds = %77
  %81 = add nsw i32 %78, %47
  %82 = mul nsw i32 %81, 3
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = fadd contract float %75, %85
  %87 = add nsw i32 %82, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fadd contract float %74, %90
  %92 = add nsw i32 %82, 2
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fadd contract float %73, %95
  %97 = add nsw i32 %71, 1
  br label %98

98:                                               ; preds = %76, %77, %80, %66
  %99 = phi float [ %67, %66 ], [ %86, %80 ], [ %75, %77 ], [ %75, %76 ]
  %100 = phi float [ %68, %66 ], [ %91, %80 ], [ %74, %77 ], [ %74, %76 ]
  %101 = phi float [ %69, %66 ], [ %96, %80 ], [ %73, %77 ], [ %73, %76 ]
  %102 = phi i32 [ %70, %66 ], [ %97, %80 ], [ %71, %77 ], [ %71, %76 ]
  %103 = add nuw nsw i32 %41, 1
  %104 = icmp eq i32 %103, %6
  br i1 %104, label %48, label %39, !llvm.loop !11

105:                                              ; preds = %39, %160
  %106 = phi i32 [ %164, %160 ], [ %40, %39 ]
  %107 = phi i32 [ %165, %160 ], [ 0, %39 ]
  %108 = phi float [ %163, %160 ], [ %42, %39 ]
  %109 = phi float [ %162, %160 ], [ %43, %39 ]
  %110 = phi float [ %161, %160 ], [ %44, %39 ]
  %111 = phi i32 [ %166, %160 ], [ 0, %39 ]
  br i1 %46, label %112, label %133

112:                                              ; preds = %105
  %113 = add nsw i32 %107, %32
  %114 = icmp slt i32 %113, %2
  br i1 %114, label %115, label %133

115:                                              ; preds = %112
  %116 = add nsw i32 %113, %47
  %117 = mul nsw i32 %116, 3
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = fadd contract float %110, %120
  %122 = add nsw i32 %117, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = fadd contract float %109, %125
  %127 = add nsw i32 %117, 2
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fadd contract float %108, %130
  %132 = add nsw i32 %106, 1
  br label %133

133:                                              ; preds = %105, %112, %115
  %134 = phi float [ %121, %115 ], [ %110, %112 ], [ %110, %105 ]
  %135 = phi float [ %126, %115 ], [ %109, %112 ], [ %109, %105 ]
  %136 = phi float [ %131, %115 ], [ %108, %112 ], [ %108, %105 ]
  %137 = phi i32 [ %132, %115 ], [ %106, %112 ], [ %106, %105 ]
  br i1 %46, label %138, label %160

138:                                              ; preds = %133
  %139 = or i32 %107, 1
  %140 = add nsw i32 %139, %32
  %141 = icmp slt i32 %140, %2
  br i1 %141, label %142, label %160

142:                                              ; preds = %138
  %143 = add nsw i32 %140, %47
  %144 = mul nsw i32 %143, 3
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = fadd contract float %134, %147
  %149 = add nsw i32 %144, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = fadd contract float %135, %152
  %154 = add nsw i32 %144, 2
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = fadd contract float %136, %157
  %159 = add nsw i32 %137, 1
  br label %160

160:                                              ; preds = %142, %138, %133
  %161 = phi float [ %148, %142 ], [ %134, %138 ], [ %134, %133 ]
  %162 = phi float [ %153, %142 ], [ %135, %138 ], [ %135, %133 ]
  %163 = phi float [ %158, %142 ], [ %136, %138 ], [ %136, %133 ]
  %164 = phi i32 [ %159, %142 ], [ %137, %138 ], [ %137, %133 ]
  %165 = add nuw nsw i32 %107, 2
  %166 = add i32 %111, 2
  %167 = icmp eq i32 %166, %37
  br i1 %167, label %66, label %105, !llvm.loop !13

168:                                              ; preds = %48, %7
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
