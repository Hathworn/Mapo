; ModuleID = '../data/hip_kernels/7764/7/main.cu'
source_filename = "../data/hip_kernels/7764/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12mult3_kernelPdS_S_S_i(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = ashr i32 %4, 1
  %16 = shl i32 %14, 1
  %17 = icmp eq i32 %14, 0
  br i1 %17, label %102, label %18

18:                                               ; preds = %5
  %19 = ashr i32 %4, 2
  %20 = sub nsw i32 %4, %16
  %21 = sub nsw i32 %19, %14
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %3, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7, !amdgpu.noclobber !5
  %25 = fsub contract double 5.000000e-01, %24
  %26 = sext i32 %14 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %3, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !7, !amdgpu.noclobber !5
  %29 = sext i32 %16 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %1, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7, !amdgpu.noclobber !5
  %32 = add nuw nsw i32 %16, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = sext i32 %20 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %20, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !5
  %43 = fsub contract double %31, %38
  %44 = fadd contract double %35, %42
  %45 = fmul contract double %25, %43
  %46 = fmul contract double %28, %44
  %47 = fsub contract double %45, %46
  %48 = fmul contract double %25, %44
  %49 = fmul contract double %28, %43
  %50 = fadd contract double %49, %48
  %51 = fsub contract double %31, %47
  %52 = fsub contract double %35, %50
  %53 = fadd contract double %38, %47
  %54 = fsub contract double %42, %50
  %55 = getelementptr inbounds double, double addrspace(1)* %2, i64 %29
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7, !amdgpu.noclobber !5
  %57 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7, !amdgpu.noclobber !5
  %61 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7, !amdgpu.noclobber !5
  %63 = fsub contract double %56, %60
  %64 = fadd contract double %58, %62
  %65 = fmul contract double %25, %63
  %66 = fmul contract double %28, %64
  %67 = fsub contract double %65, %66
  %68 = fmul contract double %25, %64
  %69 = fmul contract double %28, %63
  %70 = fadd contract double %69, %68
  %71 = fsub contract double %56, %67
  %72 = fsub contract double %58, %70
  %73 = fadd contract double %60, %67
  %74 = fsub contract double %62, %70
  %75 = fmul contract double %51, %72
  %76 = fmul contract double %52, %71
  %77 = fadd contract double %75, %76
  %78 = fmul contract double %51, %71
  %79 = fmul contract double %52, %72
  %80 = fsub contract double %78, %79
  %81 = fmul contract double %53, %74
  %82 = fmul contract double %54, %73
  %83 = fadd contract double %81, %82
  %84 = fmul contract double %53, %73
  %85 = fmul contract double %54, %74
  %86 = fsub contract double %84, %85
  %87 = fsub contract double %80, %86
  %88 = fadd contract double %77, %83
  %89 = fmul contract double %25, %87
  %90 = fmul contract double %28, %88
  %91 = fadd contract double %89, %90
  %92 = fmul contract double %25, %88
  %93 = fmul contract double %28, %87
  %94 = fsub contract double %92, %93
  %95 = fsub contract double %80, %91
  %96 = getelementptr inbounds double, double addrspace(1)* %0, i64 %29
  store double %95, double addrspace(1)* %96, align 8, !tbaa !7
  %97 = fsub contract double %94, %77
  %98 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  store double %97, double addrspace(1)* %98, align 8, !tbaa !7
  %99 = fadd contract double %86, %91
  %100 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  store double %99, double addrspace(1)* %100, align 8, !tbaa !7
  %101 = fsub contract double %94, %83
  br label %136

102:                                              ; preds = %5
  %103 = load double, double addrspace(1)* %1, align 8, !tbaa !7, !amdgpu.noclobber !5
  %104 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7, !amdgpu.noclobber !5
  %106 = load double, double addrspace(1)* %2, align 8, !tbaa !7, !amdgpu.noclobber !5
  %107 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = fmul contract double %103, %106
  %110 = fmul contract double %105, %108
  %111 = fadd contract double %109, %110
  store double %111, double addrspace(1)* %0, align 8, !tbaa !7
  %112 = fneg contract double %103
  %113 = fmul contract double %108, %112
  %114 = fmul contract double %105, %106
  %115 = fsub contract double %113, %114
  %116 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  store double %115, double addrspace(1)* %116, align 8, !tbaa !7
  %117 = sext i32 %15 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %1, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !7
  %120 = add nsw i32 %15, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %1, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7
  %124 = getelementptr inbounds double, double addrspace(1)* %2, i64 %117
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7
  %126 = getelementptr inbounds double, double addrspace(1)* %2, i64 %121
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !7
  %128 = fneg contract double %119
  %129 = fmul contract double %127, %128
  %130 = fmul contract double %123, %125
  %131 = fsub contract double %129, %130
  %132 = getelementptr inbounds double, double addrspace(1)* %0, i64 %121
  store double %131, double addrspace(1)* %132, align 8, !tbaa !7
  %133 = fmul contract double %119, %125
  %134 = fmul contract double %123, %127
  %135 = fsub contract double %133, %134
  br label %136

136:                                              ; preds = %102, %18
  %137 = phi i64 [ %117, %102 ], [ %40, %18 ]
  %138 = phi double [ %135, %102 ], [ %101, %18 ]
  %139 = getelementptr inbounds double, double addrspace(1)* %0, i64 %137
  store double %138, double addrspace(1)* %139, align 8, !tbaa !7
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
