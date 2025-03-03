; ModuleID = '../data/hip_kernels/1119/41/main.cu'
source_filename = "../data/hip_kernels/1119/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26cuSincInterpolation_kerneliPKfiiPfiiS0_iiiiii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %17, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !5, !invariant.load !6
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = add i32 %31, %25
  %33 = icmp slt i32 %15, %0
  %34 = icmp slt i32 %24, %13
  %35 = select i1 %33, i1 %34, i1 false
  %36 = icmp slt i32 %32, %13
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %180

38:                                               ; preds = %14
  %39 = add nsw i32 %24, %11
  %40 = add nsw i32 %32, %12
  %41 = mul nsw i32 %15, %5
  %42 = add i32 %39, %41
  %43 = mul i32 %42, %6
  %44 = add nsw i32 %43, %40
  %45 = sitofp i32 %39 to float
  %46 = sitofp i32 %8 to float
  %47 = fdiv contract float %45, %46
  %48 = fptosi float %47 to i32
  %49 = sitofp i32 %48 to float
  %50 = fsub contract float %47, %49
  %51 = sitofp i32 %9 to float
  %52 = fmul contract float %50, %51
  %53 = fptosi float %52 to i32
  %54 = sitofp i32 %40 to float
  %55 = fdiv contract float %54, %46
  %56 = fptosi float %55 to i32
  %57 = sitofp i32 %56 to float
  %58 = fsub contract float %55, %57
  %59 = fmul contract float %58, %51
  %60 = fptosi float %59 to i32
  %61 = icmp sgt i32 %2, 0
  br i1 %61, label %62, label %72

62:                                               ; preds = %38
  %63 = sdiv i32 %10, 2
  %64 = icmp sgt i32 %3, 0
  %65 = mul nsw i32 %15, %2
  %66 = and i32 %3, 1
  %67 = icmp eq i32 %3, 1
  %68 = and i32 %3, -2
  %69 = icmp eq i32 %66, 0
  br label %76

70:                                               ; preds = %124
  %71 = fdiv contract float %126, %125
  br label %72

72:                                               ; preds = %70, %38
  %73 = phi float [ %71, %70 ], [ 0x7FF8000000000000, %38 ]
  %74 = sext i32 %44 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %74
  store float %73, float addrspace(1)* %75, align 4, !tbaa !7
  br label %180

76:                                               ; preds = %62, %124
  %77 = phi float [ 0.000000e+00, %62 ], [ %126, %124 ]
  %78 = phi i32 [ 0, %62 ], [ %127, %124 ]
  %79 = phi float [ 0.000000e+00, %62 ], [ %125, %124 ]
  %80 = sub nsw i32 %48, %78
  %81 = add nsw i32 %80, %63
  %82 = icmp slt i32 %81, 0
  %83 = select i1 %82, i32 %10, i32 0
  %84 = add nsw i32 %83, %81
  %85 = icmp slt i32 %84, %10
  %86 = select i1 %85, i32 0, i32 %10
  %87 = sub nsw i32 %84, %86
  %88 = mul nsw i32 %87, %9
  %89 = add nsw i32 %88, %53
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %7, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  br i1 %64, label %93, label %124

93:                                               ; preds = %76
  %94 = add i32 %78, %65
  %95 = mul i32 %94, %3
  br i1 %67, label %96, label %129

96:                                               ; preds = %129, %93
  %97 = phi float [ undef, %93 ], [ %170, %129 ]
  %98 = phi float [ undef, %93 ], [ %176, %129 ]
  %99 = phi i32 [ 0, %93 ], [ %177, %129 ]
  %100 = phi float [ %77, %93 ], [ %176, %129 ]
  %101 = phi float [ %79, %93 ], [ %170, %129 ]
  br i1 %69, label %124, label %102

102:                                              ; preds = %96
  %103 = sub nsw i32 %56, %99
  %104 = add nsw i32 %103, %63
  %105 = icmp slt i32 %104, 0
  %106 = select i1 %105, i32 %10, i32 0
  %107 = add nsw i32 %106, %104
  %108 = icmp slt i32 %107, %10
  %109 = select i1 %108, i32 0, i32 %10
  %110 = sub nsw i32 %107, %109
  %111 = mul nsw i32 %110, %9
  %112 = add nsw i32 %111, %60
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %7, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !6
  %116 = fmul contract float %92, %115
  %117 = fadd contract float %101, %116
  %118 = add nsw i32 %99, %95
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fmul contract float %121, %116
  %123 = fadd contract float %100, %122
  br label %124

124:                                              ; preds = %102, %96, %76
  %125 = phi float [ %79, %76 ], [ %97, %96 ], [ %117, %102 ]
  %126 = phi float [ %77, %76 ], [ %98, %96 ], [ %123, %102 ]
  %127 = add nuw nsw i32 %78, 1
  %128 = icmp eq i32 %127, %2
  br i1 %128, label %70, label %76, !llvm.loop !11

129:                                              ; preds = %93, %129
  %130 = phi i32 [ %177, %129 ], [ 0, %93 ]
  %131 = phi float [ %176, %129 ], [ %77, %93 ]
  %132 = phi float [ %170, %129 ], [ %79, %93 ]
  %133 = phi i32 [ %178, %129 ], [ 0, %93 ]
  %134 = sub nsw i32 %56, %130
  %135 = add nsw i32 %134, %63
  %136 = icmp slt i32 %135, 0
  %137 = select i1 %136, i32 %10, i32 0
  %138 = add nsw i32 %137, %135
  %139 = icmp slt i32 %138, %10
  %140 = select i1 %139, i32 0, i32 %10
  %141 = sub nsw i32 %138, %140
  %142 = mul nsw i32 %141, %9
  %143 = add nsw i32 %142, %60
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %7, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !6
  %147 = fmul contract float %92, %146
  %148 = fadd contract float %132, %147
  %149 = add nsw i32 %130, %95
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !6
  %153 = fmul contract float %152, %147
  %154 = fadd contract float %131, %153
  %155 = or i32 %130, 1
  %156 = sub nsw i32 %56, %155
  %157 = add nsw i32 %156, %63
  %158 = icmp slt i32 %157, 0
  %159 = select i1 %158, i32 %10, i32 0
  %160 = add nsw i32 %159, %157
  %161 = icmp slt i32 %160, %10
  %162 = select i1 %161, i32 0, i32 %10
  %163 = sub nsw i32 %160, %162
  %164 = mul nsw i32 %163, %9
  %165 = add nsw i32 %164, %60
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %7, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !6
  %169 = fmul contract float %92, %168
  %170 = fadd contract float %148, %169
  %171 = add nsw i32 %155, %95
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7, !amdgpu.noclobber !6
  %175 = fmul contract float %174, %169
  %176 = fadd contract float %154, %175
  %177 = add nuw nsw i32 %130, 2
  %178 = add i32 %133, 2
  %179 = icmp eq i32 %178, %68
  br i1 %179, label %96, label %129, !llvm.loop !13

180:                                              ; preds = %14, %72
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
