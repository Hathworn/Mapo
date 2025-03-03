; ModuleID = '../data/hip_kernels/7607/4/main.cu'
source_filename = "../data/hip_kernels/7607/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11matMultCudaPfS_S_j(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = icmp ult i32 %13, %3
  %23 = icmp ult i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %180

25:                                               ; preds = %4
  %26 = mul i32 %13, %3
  %27 = and i32 %3, 7
  %28 = icmp ult i32 %3, 8
  br i1 %28, label %31, label %29

29:                                               ; preds = %25
  %30 = and i32 %3, -8
  br label %62

31:                                               ; preds = %62, %25
  %32 = phi i32 [ undef, %25 ], [ %176, %62 ]
  %33 = phi i32 [ 0, %25 ], [ %177, %62 ]
  %34 = phi i32 [ 0, %25 ], [ %176, %62 ]
  %35 = icmp eq i32 %27, 0
  br i1 %35, label %56, label %36

36:                                               ; preds = %31, %36
  %37 = phi i32 [ %53, %36 ], [ %33, %31 ]
  %38 = phi i32 [ %52, %36 ], [ %34, %31 ]
  %39 = phi i32 [ %54, %36 ], [ 0, %31 ]
  %40 = add i32 %37, %26
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul i32 %37, %3
  %45 = add i32 %44, %21
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fmul contract float %43, %48
  %50 = sitofp i32 %38 to float
  %51 = fadd contract float %49, %50
  %52 = fptosi float %51 to i32
  %53 = add nuw nsw i32 %37, 1
  %54 = add i32 %39, 1
  %55 = icmp eq i32 %54, %27
  br i1 %55, label %56, label %36, !llvm.loop !11

56:                                               ; preds = %36, %31
  %57 = phi i32 [ %32, %31 ], [ %52, %36 ]
  %58 = sitofp i32 %57 to float
  %59 = add i32 %26, %21
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  store float %58, float addrspace(1)* %61, align 4, !tbaa !7
  br label %180

62:                                               ; preds = %62, %29
  %63 = phi i32 [ 0, %29 ], [ %177, %62 ]
  %64 = phi i32 [ 0, %29 ], [ %176, %62 ]
  %65 = phi i32 [ 0, %29 ], [ %178, %62 ]
  %66 = add i32 %63, %26
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = mul i32 %63, %3
  %71 = add i32 %70, %21
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %69, %74
  %76 = sitofp i32 %64 to float
  %77 = fadd contract float %75, %76
  %78 = fptosi float %77 to i32
  %79 = or i32 %63, 1
  %80 = add i32 %79, %26
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = mul i32 %79, %3
  %85 = add i32 %84, %21
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract float %83, %88
  %90 = sitofp i32 %78 to float
  %91 = fadd contract float %89, %90
  %92 = fptosi float %91 to i32
  %93 = or i32 %63, 2
  %94 = add i32 %93, %26
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = mul i32 %93, %3
  %99 = add i32 %98, %21
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fmul contract float %97, %102
  %104 = sitofp i32 %92 to float
  %105 = fadd contract float %103, %104
  %106 = fptosi float %105 to i32
  %107 = or i32 %63, 3
  %108 = add i32 %107, %26
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = mul i32 %107, %3
  %113 = add i32 %112, %21
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract float %111, %116
  %118 = sitofp i32 %106 to float
  %119 = fadd contract float %117, %118
  %120 = fptosi float %119 to i32
  %121 = or i32 %63, 4
  %122 = add i32 %121, %26
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = mul i32 %121, %3
  %127 = add i32 %126, %21
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fmul contract float %125, %130
  %132 = sitofp i32 %120 to float
  %133 = fadd contract float %131, %132
  %134 = fptosi float %133 to i32
  %135 = or i32 %63, 5
  %136 = add i32 %135, %26
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = mul i32 %135, %3
  %141 = add i32 %140, %21
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = fmul contract float %139, %144
  %146 = sitofp i32 %134 to float
  %147 = fadd contract float %145, %146
  %148 = fptosi float %147 to i32
  %149 = or i32 %63, 6
  %150 = add i32 %149, %26
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = mul i32 %149, %3
  %155 = add i32 %154, %21
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = fmul contract float %153, %158
  %160 = sitofp i32 %148 to float
  %161 = fadd contract float %159, %160
  %162 = fptosi float %161 to i32
  %163 = or i32 %63, 7
  %164 = add i32 %163, %26
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %1, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = mul i32 %163, %3
  %169 = add i32 %168, %21
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %2, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !5
  %173 = fmul contract float %167, %172
  %174 = sitofp i32 %162 to float
  %175 = fadd contract float %173, %174
  %176 = fptosi float %175 to i32
  %177 = add nuw nsw i32 %63, 8
  %178 = add i32 %65, 8
  %179 = icmp eq i32 %178, %30
  br i1 %179, label %31, label %62, !llvm.loop !13

180:                                              ; preds = %56, %4
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
