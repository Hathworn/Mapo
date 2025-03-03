; ModuleID = '../data/hip_kernels/11810/13/main.cu'
source_filename = "../data/hip_kernels/11810/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6kernelPdS_S_S_iiS_S_S_iS_dS_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, i32 %9, double addrspace(1)* nocapture readonly %10, double %11, double addrspace(1)* nocapture writeonly %12, double addrspace(1)* nocapture writeonly %13, double addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %17
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  %32 = mul i32 %27, %31
  %33 = add i32 %32, %26
  %34 = icmp sgt i32 %33, 0
  %35 = icmp slt i32 %33, %4
  %36 = select i1 %34, i1 %35, i1 false
  %37 = icmp slt i32 %25, %5
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %68

39:                                               ; preds = %16
  %40 = mul nsw i32 %33, %5
  %41 = add nsw i32 %40, %25
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %0, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !6
  %45 = add nsw i32 %33, -1
  %46 = mul nsw i32 %45, %5
  %47 = add nsw i32 %46, %25
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !6
  %51 = fadd contract double %44, %50
  %52 = getelementptr inbounds double, double addrspace(1)* %8, i64 %42
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !6
  %54 = getelementptr inbounds double, double addrspace(1)* %8, i64 %48
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !6
  %56 = fsub contract double %53, %55
  %57 = getelementptr inbounds double, double addrspace(1)* %1, i64 %42
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !6
  %59 = fmul contract double %11, 2.000000e+00
  %60 = fdiv contract double %59, %51
  %61 = fmul contract double %60, %56
  %62 = zext i32 %33 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %6, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !6
  %65 = fmul contract double %61, %64
  %66 = fsub contract double %58, %65
  %67 = getelementptr inbounds double, double addrspace(1)* %12, i64 %42
  store double %66, double addrspace(1)* %67, align 8, !tbaa !7
  br label %68

68:                                               ; preds = %39, %16
  %69 = select i1 %35, i1 %37, i1 false
  br i1 %69, label %70, label %104

70:                                               ; preds = %68
  %71 = sitofp i32 %5 to double
  %72 = fdiv contract double 0x401921FB54442D18, %71
  %73 = sext i32 %33 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %10, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %76 = fmul contract double %72, %75
  %77 = fdiv contract double 1.000000e+00, %76
  %78 = mul nsw i32 %33, %5
  %79 = add nsw i32 %78, %25
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %0, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !7
  %83 = add nsw i32 %5, -1
  %84 = add i32 %83, %25
  %85 = srem i32 %84, %5
  %86 = add nsw i32 %85, %78
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7
  %90 = fadd contract double %82, %89
  %91 = getelementptr inbounds double, double addrspace(1)* %3, i64 %80
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7
  %93 = getelementptr inbounds double, double addrspace(1)* %3, i64 %87
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7
  %95 = fsub contract double %92, %94
  %96 = getelementptr inbounds double, double addrspace(1)* %2, i64 %80
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7
  %98 = fmul contract double %11, 2.000000e+00
  %99 = fdiv contract double %98, %90
  %100 = fmul contract double %99, %95
  %101 = fmul contract double %77, %100
  %102 = fsub contract double %97, %101
  %103 = getelementptr inbounds double, double addrspace(1)* %13, i64 %80
  store double %102, double addrspace(1)* %103, align 8, !tbaa !7
  br label %104

104:                                              ; preds = %70, %68
  %105 = icmp ne i32 %9, 0
  %106 = select i1 %105, i1 %35, i1 false
  %107 = select i1 %106, i1 %37, i1 false
  br i1 %107, label %108, label %154

108:                                              ; preds = %104
  %109 = sitofp i32 %5 to double
  %110 = fdiv contract double 0x401921FB54442D18, %109
  %111 = sext i32 %33 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %10, i64 %111
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !7
  %114 = fmul contract double %110, %113
  %115 = fdiv contract double 1.000000e+00, %114
  %116 = mul nsw i32 %33, %5
  %117 = add nsw i32 %116, %25
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %14, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !7
  %121 = getelementptr inbounds double, double addrspace(1)* %8, i64 %118
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %123 = fmul contract double %122, %11
  %124 = add nsw i32 %33, 1
  %125 = mul nsw i32 %124, %5
  %126 = add nsw i32 %125, %25
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %1, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7
  %130 = getelementptr inbounds double, double addrspace(1)* %1, i64 %118
  %131 = load double, double addrspace(1)* %130, align 8, !tbaa !7
  %132 = fsub contract double %129, %131
  %133 = fmul contract double %123, %132
  %134 = getelementptr inbounds double, double addrspace(1)* %7, i64 %111
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !7
  %136 = fmul contract double %135, %133
  %137 = fsub contract double %120, %136
  %138 = getelementptr inbounds double, double addrspace(1)* %3, i64 %118
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !7
  %140 = fmul contract double %139, %11
  %141 = add nsw i32 %25, 1
  %142 = srem i32 %141, %5
  %143 = add nsw i32 %142, %116
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, double addrspace(1)* %2, i64 %144
  %146 = load double, double addrspace(1)* %145, align 8, !tbaa !7
  %147 = getelementptr inbounds double, double addrspace(1)* %2, i64 %118
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7
  %149 = fsub contract double %146, %148
  %150 = fmul contract double %140, %149
  %151 = fmul contract double %115, %150
  %152 = fsub contract double %137, %151
  %153 = getelementptr inbounds double, double addrspace(1)* %15, i64 %118
  store double %152, double addrspace(1)* %153, align 8, !tbaa !7
  br label %154

154:                                              ; preds = %104, %108
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
