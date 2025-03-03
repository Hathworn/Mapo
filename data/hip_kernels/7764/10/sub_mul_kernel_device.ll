; ModuleID = '../data/hip_kernels/7764/10/main.cu'
source_filename = "../data/hip_kernels/7764/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14sub_mul_kernelPdS_S_S_S_i(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = ashr i32 %5, 1
  %17 = shl i32 %15, 1
  %18 = icmp eq i32 %15, 0
  br i1 %18, label %103, label %19

19:                                               ; preds = %6
  %20 = ashr i32 %5, 2
  %21 = sub nsw i32 %5, %17
  %22 = sub nsw i32 %20, %15
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %4, i64 %23
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !7, !amdgpu.noclobber !5
  %26 = fsub contract double 5.000000e-01, %25
  %27 = sext i32 %15 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %4, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7, !amdgpu.noclobber !5
  %30 = sext i32 %17 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !5
  %33 = add nuw nsw i32 %17, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = sext i32 %21 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !5
  %40 = add nsw i32 %21, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !5
  %44 = fsub contract double %32, %39
  %45 = fadd contract double %36, %43
  %46 = fmul contract double %26, %44
  %47 = fmul contract double %29, %45
  %48 = fsub contract double %46, %47
  %49 = fmul contract double %26, %45
  %50 = fmul contract double %29, %44
  %51 = fadd contract double %50, %49
  %52 = fsub contract double %32, %48
  %53 = fsub contract double %36, %51
  %54 = fadd contract double %39, %48
  %55 = fsub contract double %43, %51
  %56 = getelementptr inbounds double, double addrspace(1)* %2, i64 %30
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7, !amdgpu.noclobber !5
  %58 = getelementptr inbounds double, double addrspace(1)* %3, i64 %30
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !5
  %60 = fsub contract double %57, %59
  %61 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7, !amdgpu.noclobber !5
  %63 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = fsub contract double %62, %64
  %66 = getelementptr inbounds double, double addrspace(1)* %2, i64 %37
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7, !amdgpu.noclobber !5
  %68 = getelementptr inbounds double, double addrspace(1)* %3, i64 %37
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = fsub contract double %67, %69
  %71 = getelementptr inbounds double, double addrspace(1)* %2, i64 %41
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !5
  %73 = getelementptr inbounds double, double addrspace(1)* %3, i64 %41
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !5
  %75 = fsub contract double %72, %74
  %76 = fmul contract double %52, %65
  %77 = fmul contract double %60, %53
  %78 = fadd contract double %77, %76
  %79 = fmul contract double %60, %52
  %80 = fmul contract double %53, %65
  %81 = fsub contract double %79, %80
  %82 = fmul contract double %54, %75
  %83 = fmul contract double %55, %70
  %84 = fadd contract double %83, %82
  %85 = fmul contract double %54, %70
  %86 = fmul contract double %55, %75
  %87 = fsub contract double %85, %86
  %88 = fsub contract double %81, %87
  %89 = fadd contract double %78, %84
  %90 = fmul contract double %26, %88
  %91 = fmul contract double %29, %89
  %92 = fadd contract double %90, %91
  %93 = fmul contract double %26, %89
  %94 = fmul contract double %29, %88
  %95 = fsub contract double %93, %94
  %96 = fsub contract double %81, %92
  %97 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  store double %96, double addrspace(1)* %97, align 8, !tbaa !7
  %98 = fsub contract double %95, %78
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  store double %98, double addrspace(1)* %99, align 8, !tbaa !7
  %100 = fadd contract double %87, %92
  %101 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  store double %100, double addrspace(1)* %101, align 8, !tbaa !7
  %102 = fsub contract double %95, %84
  br label %148

103:                                              ; preds = %6
  %104 = load double, double addrspace(1)* %1, align 8, !tbaa !7, !amdgpu.noclobber !5
  %105 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !7, !amdgpu.noclobber !5
  %107 = load double, double addrspace(1)* %2, align 8, !tbaa !7, !amdgpu.noclobber !5
  %108 = load double, double addrspace(1)* %3, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = fsub contract double %107, %108
  %110 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7, !amdgpu.noclobber !5
  %112 = getelementptr inbounds double, double addrspace(1)* %3, i64 1
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !7, !amdgpu.noclobber !5
  %114 = fsub contract double %111, %113
  %115 = fmul contract double %104, %109
  %116 = fmul contract double %106, %114
  %117 = fadd contract double %115, %116
  store double %117, double addrspace(1)* %0, align 8, !tbaa !7
  %118 = fneg contract double %104
  %119 = fmul contract double %114, %118
  %120 = fmul contract double %106, %109
  %121 = fsub contract double %119, %120
  %122 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  store double %121, double addrspace(1)* %122, align 8, !tbaa !7
  %123 = sext i32 %16 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %1, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7
  %126 = add nsw i32 %16, 1
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %1, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7
  %130 = getelementptr inbounds double, double addrspace(1)* %2, i64 %123
  %131 = load double, double addrspace(1)* %130, align 8, !tbaa !7
  %132 = getelementptr inbounds double, double addrspace(1)* %3, i64 %123
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !7
  %134 = fsub contract double %131, %133
  %135 = getelementptr inbounds double, double addrspace(1)* %2, i64 %127
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !7
  %137 = getelementptr inbounds double, double addrspace(1)* %3, i64 %127
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !7
  %139 = fsub contract double %136, %138
  %140 = fneg contract double %125
  %141 = fmul contract double %139, %140
  %142 = fmul contract double %129, %134
  %143 = fsub contract double %141, %142
  %144 = getelementptr inbounds double, double addrspace(1)* %0, i64 %127
  store double %143, double addrspace(1)* %144, align 8, !tbaa !7
  %145 = fmul contract double %125, %134
  %146 = fmul contract double %129, %139
  %147 = fsub contract double %145, %146
  br label %148

148:                                              ; preds = %103, %19
  %149 = phi i64 [ %123, %103 ], [ %41, %19 ]
  %150 = phi double [ %147, %103 ], [ %102, %19 ]
  %151 = getelementptr inbounds double, double addrspace(1)* %0, i64 %149
  store double %150, double addrspace(1)* %151, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
