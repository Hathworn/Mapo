; ModuleID = '../data/hip_kernels/9068/2/main.cu'
source_filename = "../data/hip_kernels/9068/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21squareMatrixMulKernelPiS_S_i(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %3, 0
  %23 = mul nsw i32 %21, %3
  br i1 %22, label %24, label %57

24:                                               ; preds = %4
  %25 = and i32 %3, 7
  %26 = icmp ult i32 %3, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = and i32 %3, -8
  br label %62

29:                                               ; preds = %62, %24
  %30 = phi float [ undef, %24 ], [ %176, %62 ]
  %31 = phi float [ 0.000000e+00, %24 ], [ %176, %62 ]
  %32 = phi i32 [ 0, %24 ], [ %177, %62 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %54, label %34

34:                                               ; preds = %29, %34
  %35 = phi float [ %50, %34 ], [ %31, %29 ]
  %36 = phi i32 [ %51, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %52, %34 ], [ 0, %29 ]
  %38 = add nsw i32 %36, %23
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = sitofp i32 %41 to float
  %43 = mul nsw i32 %36, %3
  %44 = add nsw i32 %43, %13
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = sitofp i32 %47 to float
  %49 = fmul contract float %42, %48
  %50 = fadd contract float %35, %49
  %51 = add nuw nsw i32 %36, 1
  %52 = add i32 %37, 1
  %53 = icmp eq i32 %52, %25
  br i1 %53, label %54, label %34, !llvm.loop !11

54:                                               ; preds = %34, %29
  %55 = phi float [ %30, %29 ], [ %50, %34 ]
  %56 = fptosi float %55 to i32
  br label %57

57:                                               ; preds = %4, %54
  %58 = phi i32 [ %56, %54 ], [ 0, %4 ]
  %59 = add nsw i32 %23, %13
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  store i32 %58, i32 addrspace(1)* %61, align 4, !tbaa !7
  ret void

62:                                               ; preds = %62, %27
  %63 = phi float [ 0.000000e+00, %27 ], [ %176, %62 ]
  %64 = phi i32 [ 0, %27 ], [ %177, %62 ]
  %65 = phi i32 [ 0, %27 ], [ %178, %62 ]
  %66 = add nsw i32 %64, %23
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = sitofp i32 %69 to float
  %71 = mul nsw i32 %64, %3
  %72 = add nsw i32 %71, %13
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = sitofp i32 %75 to float
  %77 = fmul contract float %70, %76
  %78 = fadd contract float %63, %77
  %79 = or i32 %64, 1
  %80 = add nsw i32 %79, %23
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = sitofp i32 %83 to float
  %85 = mul nsw i32 %79, %3
  %86 = add nsw i32 %85, %13
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = sitofp i32 %89 to float
  %91 = fmul contract float %84, %90
  %92 = fadd contract float %78, %91
  %93 = or i32 %64, 2
  %94 = add nsw i32 %93, %23
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = sitofp i32 %97 to float
  %99 = mul nsw i32 %93, %3
  %100 = add nsw i32 %99, %13
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = sitofp i32 %103 to float
  %105 = fmul contract float %98, %104
  %106 = fadd contract float %92, %105
  %107 = or i32 %64, 3
  %108 = add nsw i32 %107, %23
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = sitofp i32 %111 to float
  %113 = mul nsw i32 %107, %3
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = sitofp i32 %117 to float
  %119 = fmul contract float %112, %118
  %120 = fadd contract float %106, %119
  %121 = or i32 %64, 4
  %122 = add nsw i32 %121, %23
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = sitofp i32 %125 to float
  %127 = mul nsw i32 %121, %3
  %128 = add nsw i32 %127, %13
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %129
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = sitofp i32 %131 to float
  %133 = fmul contract float %126, %132
  %134 = fadd contract float %120, %133
  %135 = or i32 %64, 5
  %136 = add nsw i32 %135, %23
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = sitofp i32 %139 to float
  %141 = mul nsw i32 %135, %3
  %142 = add nsw i32 %141, %13
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = sitofp i32 %145 to float
  %147 = fmul contract float %140, %146
  %148 = fadd contract float %134, %147
  %149 = or i32 %64, 6
  %150 = add nsw i32 %149, %23
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = sitofp i32 %153 to float
  %155 = mul nsw i32 %149, %3
  %156 = add nsw i32 %155, %13
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !5
  %160 = sitofp i32 %159 to float
  %161 = fmul contract float %154, %160
  %162 = fadd contract float %148, %161
  %163 = or i32 %64, 7
  %164 = add nsw i32 %163, %23
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %165
  %167 = load i32, i32 addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = sitofp i32 %167 to float
  %169 = mul nsw i32 %163, %3
  %170 = add nsw i32 %169, %13
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %171
  %173 = load i32, i32 addrspace(1)* %172, align 4, !tbaa !7, !amdgpu.noclobber !5
  %174 = sitofp i32 %173 to float
  %175 = fmul contract float %168, %174
  %176 = fadd contract float %162, %175
  %177 = add nuw nsw i32 %64, 8
  %178 = add i32 %65, 8
  %179 = icmp eq i32 %178, %28
  br i1 %179, label %29, label %62, !llvm.loop !13
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
