; ModuleID = '../data/hip_kernels/9648/0/main.cu'
source_filename = "../data/hip_kernels/9648/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11matricesMulPdS_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 2, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %12, 1000
  %22 = icmp slt i32 %20, 1000
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %154

24:                                               ; preds = %3
  %25 = mul nsw i32 %12, 1000
  br label %30

26:                                               ; preds = %30
  %27 = add nsw i32 %25, %20
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %2, i64 %28
  store double %151, double addrspace(1)* %29, align 8, !tbaa !7
  br label %154

30:                                               ; preds = %30, %24
  %31 = phi i32 [ 0, %24 ], [ %152, %30 ]
  %32 = phi double [ 0.000000e+00, %24 ], [ %151, %30 ]
  %33 = add nsw i32 %31, %25
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = mul nuw nsw i32 %31, 1000
  %38 = add nsw i32 %37, %20
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract double %36, %41
  %43 = fadd contract double %32, %42
  %44 = or i32 %31, 1
  %45 = add nsw i32 %44, %25
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !5
  %49 = mul nuw nsw i32 %44, 1000
  %50 = add nsw i32 %49, %20
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract double %48, %53
  %55 = fadd contract double %43, %54
  %56 = add nuw nsw i32 %31, 2
  %57 = add nsw i32 %56, %25
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %0, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7, !amdgpu.noclobber !5
  %61 = mul nuw nsw i32 %56, 1000
  %62 = add nsw i32 %61, %20
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract double %60, %65
  %67 = fadd contract double %55, %66
  %68 = add nuw nsw i32 %31, 3
  %69 = add nsw i32 %68, %25
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !5
  %73 = mul nuw nsw i32 %68, 1000
  %74 = add nsw i32 %73, %20
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %1, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract double %72, %77
  %79 = fadd contract double %67, %78
  %80 = add nuw nsw i32 %31, 4
  %81 = add nsw i32 %80, %25
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %0, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7, !amdgpu.noclobber !5
  %85 = mul nuw nsw i32 %80, 1000
  %86 = add nsw i32 %85, %20
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %1, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7, !amdgpu.noclobber !5
  %90 = fmul contract double %84, %89
  %91 = fadd contract double %79, %90
  %92 = add nuw nsw i32 %31, 5
  %93 = add nsw i32 %92, %25
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, double addrspace(1)* %0, i64 %94
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7, !amdgpu.noclobber !5
  %97 = mul nuw nsw i32 %92, 1000
  %98 = add nsw i32 %97, %20
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %1, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract double %96, %101
  %103 = fadd contract double %91, %102
  %104 = add nuw nsw i32 %31, 6
  %105 = add nsw i32 %104, %25
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %0, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = mul nuw nsw i32 %104, 1000
  %110 = add nsw i32 %109, %20
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %1, i64 %111
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !7, !amdgpu.noclobber !5
  %114 = fmul contract double %108, %113
  %115 = fadd contract double %103, %114
  %116 = add nuw nsw i32 %31, 7
  %117 = add nsw i32 %116, %25
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %0, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !7, !amdgpu.noclobber !5
  %121 = mul nuw nsw i32 %116, 1000
  %122 = add nsw i32 %121, %20
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %1, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract double %120, %125
  %127 = fadd contract double %115, %126
  %128 = add nuw nsw i32 %31, 8
  %129 = add nsw i32 %128, %25
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %0, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !7, !amdgpu.noclobber !5
  %133 = mul nuw nsw i32 %128, 1000
  %134 = add nsw i32 %133, %20
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %1, i64 %135
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract double %132, %137
  %139 = fadd contract double %127, %138
  %140 = add nuw nsw i32 %31, 9
  %141 = add nsw i32 %140, %25
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds double, double addrspace(1)* %0, i64 %142
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !7, !amdgpu.noclobber !5
  %145 = mul nuw nsw i32 %140, 1000
  %146 = add nsw i32 %145, %20
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds double, double addrspace(1)* %1, i64 %147
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !7, !amdgpu.noclobber !5
  %150 = fmul contract double %144, %149
  %151 = fadd contract double %139, %150
  %152 = add nuw nsw i32 %31, 10
  %153 = icmp eq i32 %152, 1000
  br i1 %153, label %26, label %30, !llvm.loop !11

154:                                              ; preds = %26, %3
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
